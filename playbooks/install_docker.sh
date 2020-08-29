#!/bin/bash
#Install docker from Rancher Upstream
curl https://releases.rancher.com/install-docker/18.09.sh | sh
# Add root to the docker group.
sudo usermod -aG docker root
