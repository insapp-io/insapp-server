# insapp-server

Insapp architecture

## Server setup

Clone this repository and its submodules:

    git clone --recursive https://github.com/thomas-bouvier/insapp-server.git

Customize the server by running the `install.sh` script:

    chmod +x install.sh
    ./install.sh

You can now build and run the Docker instance with:

    docker-compose build
    docker-compose up -d

You're all set!

## Pull updates

To pull last updates, simply run the `pull_changes.sh` script:

    chmod +x pull_changes.sh
    ./pull_changes.sh

## Database dump

To create a binary export of the MongoDB database, use the following command:

    docker exec <container_name> mongodump -u insapp-admin -p <password> --authenticationDatabase admin --out /data/db/backups/`date +%Y-%m-%d` --db insapp

You can configure automatic backups to Dropbox by running the `enable_backups.sh` script. You should edit it beforehand to configure the name of the Docker instance running MongoDB.

## Manual configuration

If you want to manually customize the server, you should edit the following configuration files:

* docker-compose.yml
* traefik.toml
* insapp-go/Dockerfile
* insapp-go/src/config.json
* insapp-web/app/app.config.json
