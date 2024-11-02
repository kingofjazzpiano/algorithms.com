#!/bin/bash

alias rm='rm -i'
source ~/.bashrc
sudo apt update
sudo apt install micro -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo | sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce -y
docker build -t algorithms.com . --progress=plain | tee build.log
