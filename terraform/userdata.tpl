#!/bin/bash
sudo apt-get update -y
sudo apt install python3-pip -y
sudo apt-get install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt install ansible -y