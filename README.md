# docker-x64-ubuntu-nginx-php7-nodejs
Docker Image Ubuntu 16.04 with nginx, php7 and node.js for scaleway server x64

Reverse proxy - all protocols (websockets, ...) in port 80/443

# Configuration

## nginx

### general conf 

change file build/nginx/nginx.conf
   
### reverse proxy 

change file build/nginx/sites-available/projects to
* add/modify websocket port
* add/modify url nodejs application

## autostart process when docker container start

Change file build/supervisord.conf to autostart nodejs application

# Build Docker Image
```bash
./build.sh
```

# Run Docker Image
```bash
./run.sh [web directory]
```

Sample [web directory] structure : 

[web directory]  
      | nodejs -> nodejs application  
      | php -> PHP dependancies (composer, ...)  
      | www -> public web directory  
      
