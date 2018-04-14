#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y upgrade

# Prepare insapp-server configuration

cp docker-compose.yml.dist docker-compose.yml
cp traefik.toml.dist traefik.toml

echo "What is the domain name that points to this server (insapp.fr):"
read domain

echo "What is your contact email adress (insapp.contact@gmail.com):"
read email

echo "What should be the API exposed port (9000):"
read port

sed -i "s/REPLACE_WITH_YOUR_HOST/$domain/g" docker-compose.yml
sed -i "s/REPLACE_WITH_YOUR_HOST/$domain/g" traefik.toml

sed -i "s/REPLACE_WITH_YOUR_EMAIL/$email/g" traefik.toml

sed -i "s/REPLACE_WITH_THE_API_PORT/$port/g" docker-compose.yml

# Prepare insapp-go configuration

cp insapp-go/Dockerfile.dist insapp-go/Dockerfile
cp insapp-go/src/config.json.dist insapp-go/src/config.json

sed -i "s/REPLACE_WITH_YOUR_EMAIL/$email/g" insapp-go/src/config.json

sed -i "s/REPLACE_WITH_THE_API_PORT/$port/g" insapp-go/Dockerfile
sed -i "s/REPLACE_WITH_THE_API_PORT/$port/g" insapp-go/src/config.json

# Prepare insapp-web configuration

cp insapp-web/app/app.config.js.dist insapp-web/app/app.config.js

sed -i "s/REPLACE_WITH_YOUR_HOST/$domain/g" insapp-web/app/app.config.js
