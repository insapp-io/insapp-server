#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y upgrade

# Create CRON jobs

crontab -l | { cat; echo "30 3 * * * docker exec insapp-server_db_1 mongodump -u insapp-admin -p REPLACE_WITH_THE_MONGO_PASSWORD --authenticationDatabase admin --out /data/db/backups/`date +%Y-%m-%d` --db insapp"; } | crontab -

crontab -l | { cat; echo "45 3 * * * $(dirname $(readlink -f $0))/insapp-backup/dropbox-uploader/dropbox_uploader.sh -f $(dirname $(readlink -f $0))/insapp-backup/dropbox_uploader.conf upload $(dirname $(readlink -f $0))/insapp-db/backups/`date +%Y-%m-%d`/ /`date +%Y-%m-%d"`/db >> /var/log/dropbox_uploader.log 2>&1"; } | crontab -

crontab -l | { cat; echo "0 4 * * * $(dirname $(readlink -f $0))/insapp-backup/dropbox-uploader/dropbox_uploader.sh -f $(dirname $(readlink -f $0))/insapp-backup/dropbox_uploader.conf upload $(dirname $(readlink -f $0))/insapp-cdn/ /`date +%Y-%m-%d"`/cdn >> /var/log/dropbox_uploader.log 2>&1"; } | crontab -
