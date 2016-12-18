FROM ubuntu:16.04

MAINTAINER Emmanuel ROECKER <emmanuel.roecker@glicer.com>

RUN apt-get update && apt-get upgrade -y

# install supervisor
RUN apt-get install -y supervisor

# install nginx
RUN apt-get install -y nginx

# install php 7
RUN apt-get install -y php7.0 php7.0-fpm php7.0-sqlite3

# install latest version of nodejs
RUN apt-get install -y nodejs

# configure projects user
RUN useradd -m projects

# disable service nginx mode
RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

# default directories and delete default nginx site
RUN mkdir -p /var/run/php && mkdir -p /home/projects/www && rm /etc/nginx/sites-enabled/default

#Copy supervisor configuration
COPY build/supervisord.conf /etc/supervisor/supervisord.conf

# Configure Services and Port
COPY build/start.sh /start.sh
ENTRYPOINT ["/bin/bash", "/start.sh"]


EXPOSE 80 443

