### Ansible is installed in our server machine and ready to execute ansible playbook.
## 1. Add Public/Private IP Address to Hosts file:
*  Add public or private ip address to your hosts file which is located in `/etc/ansible/hosts` [Ubuntu OS] using below command. Location varies if you're using Amazon Linux or some other distro. 
```
sudo vi /etc/ansible/hosts
```
* This is must because to execute our playbook from master machine to different slave machines, first we must enable connection with slave machines through ip address in hosts file.
```
ansible all -m ping
```
* This command is used to check the connection with slave machines.
* [Install Ansible](https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu) if not installed in your machine 

## 2. Install and Deploy sample web app using playbook.
* Install tomcat web server and deploying a sample war file in it on our server machine using playbook.
* Playbooks are written using [Modules](https://docs.ansible.com/ansible/2.9/modules/list_of_all_modules.html)
* First we have to create `tomcat.yaml` file in our server.
```
sudo vi tomcat.yaml
```
* Check my ```tomcat.yaml``` file and copy paste the script.
```
ansible-playbook tomcat.yaml
```
![TomcatRunCommand](https://drive.google.com/uc?export=view&id=1HBC54lDmhUxF1FmKEH95qCM9jzPoVUYd)

* Above command will install tomcat, download sample war file and also deploy it. It runs on port 8080.

![TomcatServer](https://drive.google.com/uc?export=view&id=1mN3P1yG6cd41kIUkl1S9NjM-cT6mIpio)

![SampleApp](https://drive.google.com/uc?export=view&id=1Cw2b27jEAyGQyvUPFBOVeJLYGaGfMynX)

## 3. Install Nginx using playbook
* Using playbook we can install nginx web server.
* Check ```nginx.yaml``` file in my repository for script.
```
sudo vi nginx.yaml
```
* Copy paste or write your own playbook, Save it and run the below command.
```
ansible-playbook nginx.yaml
```

![NginxPlaybookRun](https://drive.google.com/uc?export=view&id=1jfutT7wNlEiSADjvPYl8YHwSGYYoqgWw)

![NginxServer](https://drive.google.com/uc?export=view&id=1si-JzMkljNDrzPxJvexAO95a2xB4bvkA)

## FAQ
### 1. Where to find the modules ?
[Modules](https://docs.ansible.com/ansible/2.9/modules/list_of_all_modules.html) are available on ansible documentation and it can be used for our reference.

### 2. Can i execute these tasks without playbook ?
Yes, it is called AD HOC Commands. It is used to execute single task. To perform another task you have to excute the command again. Here i'm using ad hoc command to install httpd server.
```
ansible all -m apt -a "name=httpd state=present" -b
```