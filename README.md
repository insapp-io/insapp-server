# insapp-server

Insapp architecture

## Install the server

    git clone --recursive https://github.com/tomatrocho/insapp-server
    cd insapp-server

Don't forget to update your port in `docker-compose.yml` (default: 9000, must match with insapp-go/Dockerfile, insapp-go/src/config.json and insapp-web/nginx.conf).
