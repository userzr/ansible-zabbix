#!/bin/bash
sudo yum update
sudo yum -y install epel-release
sudo yum update
sudo yum -y install python-setuptools python-devel python-pip openssl-devel libffi-devel
sudo pip install -U pip
sudo pip install ansible