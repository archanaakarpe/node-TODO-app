#!/bin/bash

if [ ! "$(docker ps -a -q)" ]; then
        echo "cleanup"
        docker kill $(docker ps -q)
        docker rm $(docker ps -a -q)
        docker rmi $(docker images -q)
fi
echo "Running Container"
docker build . -t node-app
docker run -d --name node-app -p 8000:8000 node-app
