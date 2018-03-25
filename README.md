# insapp-server

Insapp architecture

## Server setup

    git clone --recursive https://github.com/tomatrocho/insapp-server.git

Don't forget to customize the following files:

    * `docker-compose.yml`
    * `traefik.toml`
    * `insapp-go/Dockerfile`
    * `insapp-go/src/config.json`
    * `insapp-web/app/app.config.json`

You can now run the Docker instance with:

    cd insapp-server
    docker-compose build
    docker-compose up -d

## Pull updates

To pull last updates, simply run:

    git pull && git submodule foreach git pull origin master

## Database dump

To regularly create a binary export of the contents of the MongoDB database, add the following CRON task:

    30 1 * * * docker exec insappprod_mongo_1 mongodump --out /data/db/current-backup --db insapp ; touch /root/insapp-prod/insapp-db/current-backup/date.txt
