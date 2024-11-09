#!/bin/bash

docker pull structurizr/lite
docker rm -f structurizr-lite
docker run -d -p 8080:8080 -v $(pwd)/structurizr_workspace:/usr/local/structurizr --name structurizr-lite structurizr/lite
