#!/bin/bash

docker run -i -t -p 8888:80 --name projects --entrypoint /bin/bash -v $1:/etc/nginx/sites-enabled:ro -v $2:/home/projects:ro glicer/docker-x64-ubuntu-nginx-php7-nodejs
