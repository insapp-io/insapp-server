# insapp-server

Insapp architecture

Related repositories: [API](https://github.com/thomas-bouvier/insapp-go), [web](https://github.com/thomas-bouvier/insapp-web), [Android](https://github.com/thomas-bouvier/insapp-android), [iOS version](https://github.com/RobAddict/insapp-iOS).

## Server Setup

This currently doesn't work on Windows because the Mongo image can't read bind mounts from NTFS volumes. This could probably be fixed by using [volumes](https://docs.docker.com/storage/volumes/).

Clone this repository and its submodules:

    git clone --recursive https://github.com/thomas-bouvier/insapp-server.git

Customize the server by running the `install.sh` script:

    chmod +x install.sh
    ./install.sh

You can now build and run the Docker instance with:

    docker-compose build
    docker-compose up -d

You're all set!

## CLI

The [api](https://github.com/thomas-bouvier/insapp-go) contains a CLI:

    docker-compose exec api ./insapp-cli

### Create your first association

To create your first association (a master association) that can create other associations from the web interface, use:

    docker-compose exec api ./insapp-cli association create --name MyFirstAssociation --email yourEmail@exemple.com

## Pull updates

To pull last updates, simply run the `pull_changes.sh` script:

    chmod +x pull_changes.sh
    ./pull_changes.sh

## Database

Folder `./insapp-db` is bound to `/data/db` in db container.

    docker-compose exec db mongo -u insapp-admin -p <password>

### Database Dump

To create a binary export of the MongoDB database, use the following command:

    docker-compose exec db mongodump -u insapp-admin -p <password> --authenticationDatabase admin --out /data/db/backups/`date +%Y-%m-%d` --db insapp

You can configure automatic backups to Dropbox by running the `enable_backups.sh` script. You should edit it beforehand to configure the name of the Docker instance running MongoDB.

### Database Restoration

Place a dump in `./insapp-db/current-backup/`, then run:

    docker-compose exec db mongorestore -u insapp-admin -p <password> -d insapp --authenticationDatabase admin /data/db/current-backup/insapp

## Manual configuration

If you want to manually customize the server, you should edit the following configuration files:

* `docker-compose.yml`
* `traefik.toml`
* `insapp-go/Dockerfile`
* `insapp-go/config.json`
* `insapp-web/app/src/js/config/app.config.js`
