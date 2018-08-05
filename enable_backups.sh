#!/usr/bin/env bash

apt-get update
apt-get -y upgrade

git clone https://github.com/andreafabrizi/Dropbox-Uploader.git

# Creating CRON jobs

echo "Make sure to run this script as root for the CRON jobs to be executed."

crontab -l | { cat; echo "30 3 1,15 * * docker exec insapp-server_db_1 mongodump -u insapp-admin -p REPLACE_WITH_THE_MONGO_PASSWORD --authenticationDatabase admin --out /data/db/backups/\$(date +\%Y-\%m-\%d) --db insapp"; } | crontab -

crontab -l | { cat; echo "45 3 1,15 * * $(dirname $(readlink -f $0))/Dropbox-Uploader/dropbox_uploader.sh -f $(dirname $(readlink -f $0))/dropbox-uploader.conf upload $(dirname $(readlink -f $0))/insapp-db/backups/\$(date +\%Y-\%m-\%d)/ /\$(date +\%Y-\%m-\%d)/db >> /var/log/dropbox-uploader.log 2>&1"; } | crontab -

crontab -l | { cat; echo "0 4 1,15 * * $(dirname $(readlink -f $0))/Dropbox-Uploader/dropbox_uploader.sh -f $(dirname $(readlink -f $0))/dropbox-uploader.conf upload $(dirname $(readlink -f $0))/insapp-cdn/ /\$(date +\%Y-\%m-\%d)/cdn >> /var/log/dropbox-uploader.log 2>&1"; } | crontab -

echo "The CRON jobs have successfully been created."

# Running Dropbox-Uploader

chmod +x Dropbox-Uploader/dropbox_uploader.sh
./Dropbox-Uploader/dropbox_uploader.sh -f $(dirname $(readlink -f $0))/dropbox-uploader.conf
