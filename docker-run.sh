#!/bin/bash

export SMTP_HOST="mail.host.net"
export SMTP_USERNAME="emmanuel.rkr@glicer.com"
export SMTP_PASSWORD="****************"

pushd ./run
./render-templates.sh ./sites-templates ./sites-enabled
popd

docker run -p 8888:80 -p 8889:443 --name projects \
-v $1:/etc/nginx/nginx_shared_core.conf \
-v $2:/etc/nginx/sites-enabled \
-v $3:/home/projects \
glicer/docker-x64-ubuntu-nginx-php7-nodejs
