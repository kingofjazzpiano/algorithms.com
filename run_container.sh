#!bin/bash

IMAGE_NAME = algorithms.com

docker run -it -p 8000:8000 --name algocontainer $IMAGE_NAME /bin/bash
