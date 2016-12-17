FROM ubuntu:16.04

MAINTAINER Emmanuel ROECKER <emmanuel.roecker@glicer.com>


RUN apt-get update && apt-get upgrade -y

# install supervisor
RUN apt-get install -y supervisor

# install nginx
RUN apt-get install -y nginx

# install php 7
RUN apt-get install -y php7.0 php7.0-fpm php7.0-sqlite3

#install latest version of nodejs
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y git

#configure projects user
RUN useradd -m projects

COPY build/nginx/ /etc/nginx/

RUN mkdir -p /var/run/php && mkdir -p /home/projects/www && rm /etc/nginx/sites-enabled/default

#Copy supervisor configuration
COPY build/supervisord.conf /etc/supervisor/supervisord.conf

# Configure Services and Port
COPY build/start.sh /start.sh
ENTRYPOINT ["/bin/bash", "/start.sh"]

#CMD service php7.0-fpm start
#CMD service nginx start

EXPOSE 80 443

