#!/bin/bash

docker rm -f glicer/docker-x64-ubuntu-nginx-php7-nodejs
docker build -t glicer/docker-x64-ubuntu-nginx-php7-nodejs .
