# insapp-server

Insapp architecture

## Server setup

    git clone --recursive https://github.com/thomas-bouvier/insapp-server.git

Don't forget to customize the following files:

* docker-compose.yml (the API exposed port & host domain)
* traefik.toml (your email & host domain)
* insapp-go/Dockerfile (the API exposed port)
* insapp-go/src/config.json
* insapp-web/app/app.config.json
* insapp-backup/dropbox_uploader.conf

You can now run the Docker instance with:

    docker-compose up -d --build

## Pull updates

To pull last updates, simply run:

    git pull && git submodule foreach git pull origin master

## Database dump

To regularly create a binary export of the contents of the MongoDB database, add the following CRON task:

    30 1 * * * docker exec insappserver_db_1 mongodump --out /data/db/current-backup --db insapp ; touch /root/insapp-server/insapp-db/current-backup/date.txt
