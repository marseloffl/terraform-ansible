# Create VPC
resource "aws_vpc" "test_vpc" {
  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "test-vpc"
  }
}

# Create Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "192.168.0.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"

  tags = {
    Name = "test-public-subnet"
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "test_igw" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "test-igw"
  }
}

# Create Route Table
resource "aws_route_table" "test_rt" {
  vpc_id = aws_vpc.test_vpc.id

  tags = {
    Name = "test-rt"
  }
}

# Attach internet gateway with toute table
resource "aws_route" "attach_igw" {
  route_table_id         = aws_route_table.test_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.test_igw.id
}

# Associate subnet with route table
resource "aws_route_table_association" "subnet_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.test_rt.id
}

# Create security group
resource "aws_security_group" "test_sg" {
  name        = "test-sg"
  description = "test security group"
  vpc_id      = aws_vpc.test_vpc.id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Key Pair
resource "aws_key_pair" "test_auth" {
  key_name   = "testkey"
  public_key = file("~/.ssh/testkey.pub")
}

#Create EC2 Instance
resource "aws_instance" "test_server" {
  instance_type          = "t2.micro"
  ami                    = data.aws_ami.server_ami.id
  key_name               = aws_key_pair.test_auth.id
  vpc_security_group_ids = [aws_security_group.test_sg.id]
  subnet_id              = aws_subnet.public_subnet.id
  user_data              = file("userdata.tpl")

  root_block_device {
    volume_size = 8
  }

  tags = {
    Name = "test-server"
  }

  provisioner "local-exec" {
    command = templatefile("${var.host_os}-ssh-config.tpl", {
      hostname     = self.public_ip,
      user         = "ubuntu"
      identityfile = "~/.ssh/testkey"
    })
    interpreter = var.host_os == "windows" ? ["Powershell", "-Command"] : ["bash", "-c"]
  }
}

