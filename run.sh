#!/bin/bash

docker run -p 8888:80 -p 8889:443 --name projects -v $1:/etc/nginx/sites-enabled -v $2:/home/projects:ro glicer/docker-x64-ubuntu-nginx-php7-nodejs
