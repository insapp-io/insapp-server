# insapp-server

Insapp architecture

## Install the server

    git clone --recursive https://github.com/tomatrocho/insapp-server
    cd insapp-server

Don't forget to update your port in `docker-compose.yml` (default: 9000, must match with `insapp-go/Dockerfile`, `insapp-go/src/config.json` and `insapp-web/nginx.conf`).

## Database dump

To regularly create a binary export of the contents of the MongoDB database, add the following CRON task:

    30 1 * * * docker exec insappprod_mongo_1 mongodump --out /data/db/current-backup --db insapp ; touch /root/insapp-prod/insapp-db/current-backup/date.txt
