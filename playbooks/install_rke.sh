#!/bin/bash
# sudo wget https://github.com/rancher/rke/releases/download/v0.1.15/rke
sudo wget https://github.com/rancher/rke/releases/download/v0.2.8/rke_linux-amd64
# sudo wget https://github.com/rancher/rke/releases/download/v1.1.2/rke_linux-amd64
sudo chmod 700 rke_linux-amd64
sudo mv rke_linux-amd64 /bin/rke
# Generate ssh-key
ssh-keygen -t rsa -f /root/.ssh/id_rsa -q -P ""
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
# Install Kubectl