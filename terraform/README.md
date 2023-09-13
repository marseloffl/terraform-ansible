## 1. Initialize our working directory
* After typing all codes and creating files, we have to initialize our wroking directory
```
terraform init
```
* Above command will initialize our working directory.

## 2. Create Key Pair
* We have ssh and login to machine with keypair. so we have to create new one.
```
ssh-keygen rsa
```
* Type this command and provide the location Eg: ```C:\Users\NAME\.ssh/testkey``` it will create a rsa type public and private key pair in .ssh folder in your local machine also in aws.

* If you don't want to create new key pair means then you use your existing key pair in aws account. 

## 3. Check the plan.
* After initializing check the plan that are going to be created in our infrastructure.
```
terraform plan
```
* Above command will display the resources that are going to be executed.

![Plan](https://drive.google.com/uc?export=view&id=1TVW8OC5zO3ZWWJu4xAdJZHo3mjO0_oNe)

## 4. Apply the plan.
* After viewing the plan any changes can be done before apply.
```
terraform apply -auto-approve
```
* Above command will execute and our insfrastructure will be created.

![Applied](https://drive.google.com/uc?export=view&id=1iR4dHa2q0bVur8vXCW2yOgzdZQNr292h)

## 5. Let's see what are the resources created.
1. New VPC

![test-vpc](https://drive.google.com/uc?export=view&id=1WzuGNxO9r3Mmcn5t0nv0GFfERrrX_ZlC) 

2. New Subnet

![publicsubnet](https://drive.google.com/uc?export=view&id=1SL50GKmCyO8EehV3GQwRbiwtsvYhLjEV)

3. New Internet Gateway

![InternetGateway](https://drive.google.com/uc?export=view&id=1Ghnuy7MXW9N4oOcpc822tkaHMFuByq7P)

4. New Route Table

![RouteTable](https://drive.google.com/uc?export=view&id=1hwrcL-MHCpeiyJEL8VIuiXPxzm_L1jLv)

5. Subnet Associated

![SubnetAssociated](https://drive.google.com/uc?export=view&id=1C6NYoJ2l11qyDaL0gHweHULDH4B7Uv2s)

6. Internet Gateway Route

![IGW-Route](https://drive.google.com/uc?export=view&id=1yggOUo2CaHdsQTEHdnDC5sZOmGLkyj25)

7. New Security Group with inbound and outbound rules

![SecurityGroup](https://drive.google.com/uc?export=view&id=1SGmWnR0REf8Z5_aI-uJR8Mfad_Km8IV_)

8. New EC2 Instance Launched

![NewInstance](https://drive.google.com/uc?export=view&id=1MCHATdFPEen0z8QCQmCjtRAMyi6yqdO9)

It also execute the Userdate from ```userdata.tpl``` file and it installed python pip and ansible.

## 6 . Check Output
* We can provide many outputs to be viewed later in outputs.tf file.
```
terraform output
```
* The above command will display the outputs of which we provided in our outputs file.

![Outputs](https://drive.google.com/uc?export=view&id=11YNWNexKKPvmlBZZai1a0cLaSEQIIYF1)

## Some Commands in terraform.
* To Destroy our insfrastructure
```
terraform plan destroy
```
```
terraform destroy
```
* To Show the list / state
```
terraform state list
```
* To show particular state
```
terraform state show aws_vpc.test_vpc
```
* To apply newly added without destroying
```
terraform apply -refresh-only
```

## FAQ
### 1. Will AWS Charges us for this demonstration?
No. We can use free tier instance type and storage.