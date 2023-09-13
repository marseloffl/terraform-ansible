# Creating an Infrastructure in AWS Using Terraform and configuring using Ansible.

## Aim :
To Create a infrastructure in AWS using terraform and deploy sample web app in tomcat using ansible playbook. Also to install nginx server and jenkins using different ansible playbook for examples.

![Architecture](https://drive.google.com/uc?export=view&id=1CV4yKNUPy2-bGsGeJhK_02yGqFdG0xdM)

## Prerequisite
1. AWS Account
2. AWS IAM User [Attach EC2 Full Access and VPC Full Access or attach Administrator access policy]
3. VS Code Editor or any other tool for creating terraform file and ansible playbook
4. Terraform installed in local desktop. Add the path in System Environment. [Install Terraform](https://developer.hashicorp.com/terraform/downloads)

## Step 1. VS Code Editor Setup
* First install ```AWS Toolkit``` plugin and configure it with IAM User access ID and secret key and also create a profile.
* Create a new folder for the terraform file and workspace. Open that folder and start typing.

## Step 2. Create Terraform Files
* Check terraform folder for files, commands and screenshots.

## Step 3. Create Ansible playbook
* After infrastructure was created, we have to configure our server machine with ansible playbook like installing, deploying and configuring.
* Ansbile playbook are written in yml or yaml file.
* Check ansible folder.


