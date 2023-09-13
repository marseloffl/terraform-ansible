output "vpc_id" {
    value = aws_vpc.test_vpc.id
}

output "instance_id" {
    value = aws_instance.test_server.id
}

output "public_ip" {
    value = aws_instance.test_server.public_ip
}