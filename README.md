# docker-x64-ubuntu-nginx-php7-nodejs
Docker Image Ubuntu 16.04 x64 with nginx, php7, nvm, node.js 6 lts, sqlite3 and cron 

Reverse proxy - all protocols (websockets, ...) in port 80/443


# Build Docker Image

## Configure autostart process when docker container start

Modify file build/supervisord.conf to autostart nodejs application added

## Build command

```bash
./build.sh
```

# Run Docker Image

## Configure nginx core config

Modify file build/nginx_shared_core.conf

## Configure environments variables

Modify run.sh

## Run command

```bash
./docker-run.sh [nginx core include conf file] [nginx conf sites enabled directory] [supervisord.conf file] [web directory]
```

http://localhost:8888 -> container:80
https://localhost:8889 -> container:443

sample : 

```console
./docker-run.sh ./build/nginx_shared_core.conf ./build/sites-enabled /home/user/nginx-www ./build/env.list
```

output : 

```console
2016-12-18 18:56:07,608 CRIT Supervisor running as root (no user in config file)
2016-12-18 18:56:07,611 INFO supervisord started with pid 7
2016-12-18 18:56:08,616 INFO spawned: 'glchat' with pid 10
2016-12-18 18:56:08,619 INFO spawned: 'php-fpm7.0' with pid 11
2016-12-18 18:56:08,620 INFO spawned: 'nginx' with pid 12
2016-12-18 18:56:08,622 INFO spawned: 'gltodo' with pid 13
2016-12-18 18:56:09,869 INFO success: glchat entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2016-12-18 18:56:09,869 INFO success: php-fpm7.0 entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2016-12-18 18:56:09,870 INFO success: nginx entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
2016-12-18 18:56:09,870 INFO success: gltodo entered RUNNING state, process has stayed up for > than 1 seconds (startsecs)
```

Sample [nginx conf directory] in build/sites-enabled

Sample [web directory] structure : 

[web directory]  
      | nodejs -> nodejs application  
      | php -> PHP dependancies (composer, ...)  
      | www -> public web directory  
      

# Exec bash interactive

```bash
./docker-exec-bash.sh
```
output interactive bash : 

```console
root@840fc451051a:/# 
```
