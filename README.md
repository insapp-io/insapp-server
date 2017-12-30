# insapp-server

Insapp architecture

## Server setup

    git clone --recursive https://github.com/tomatrocho/insapp-server

Don't forget to update your port in `docker-compose.yml` (default: 9000, must match with `insapp-go/Dockerfile`, `insapp-go/src/config.json` and `insapp-web/nginx.conf`).

You can now run the Docker instance with:

    cd insapp-server
    docker-compose build
    docker-compose up -d

## Pull updates

To pull last updates, simply run:

    cd insapp-server
    docker-compose stop
    git pull && git submodule foreach git pull origin master
    docker-compose build
    docker-compose up -d

## Database dump

To regularly create a binary export of the contents of the MongoDB database, add the following CRON task:

    30 1 * * * docker exec insappprod_mongo_1 mongodump --out /data/db/current-backup --db insapp ; touch /root/insapp-prod/insapp-db/current-backup/date.txt
