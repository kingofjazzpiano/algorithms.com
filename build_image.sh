#!/bin/bash

IMAGE_NAME = "algorithms.com"

sudo apt update
sudo apt install micro -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo | sudo add-apt-repository "deb [arch=arm64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce -y
docker rmi -f $IMAGE_NAME
docker build --no-cache -t $IMAGE_NAME . --progress=plain | tee build_image.log
