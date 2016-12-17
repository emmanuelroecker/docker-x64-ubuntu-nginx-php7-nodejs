#!/bin/bash

docker run -p 8888:80 --name projects -v $1:/home/projects:ro glicer/docker-x64-ubuntu-nginx-php7-nodejs
