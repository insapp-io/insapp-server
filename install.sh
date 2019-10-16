#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y upgrade

# Copying configuration files

cp docker-compose.yml.dist docker-compose.yml
cp traefik.toml.dist traefik.toml
cp enable_backups.sh.dist enable_backups.sh
cp insapp-web/app/app.config.js.dist insapp-web/app/app.config.js
cp insapp-go/Dockerfile.dist insapp-go/Dockerfile
cp insapp-go/config.json.dist insapp-go/config.json

# Asking for parameters

echo "What should be the domain name that points to this server (insapp.fr):"
read domain

echo "What should be the environment type (dev or prod):"
read environment

echo "What is your Gmail address (insapp.contact@gmail.com):"
read email

echo "What is your Gmail password:"
read email_password

echo "What is the Firebase server key:"
read firebase_key

echo "What should be the API exposed port (9000):"
read port

echo "What should be the MongoDB database password:"
read mongo_password

# Replacing parameters in configuration files

sed -i "s/REPLACE_WITH_THE_HOST_DOMAIN/$domain/g" docker-compose.yml
sed -i "s/REPLACE_WITH_THE_API_PORT/$port/g" docker-compose.yml
sed -i "s/REPLACE_WITH_THE_MONGO_PASSWORD/$mongo_password/g" docker-compose.yml

sed -i "s/REPLACE_WITH_THE_HOST_DOMAIN/$domain/g" traefik.toml
sed -i "s/REPLACE_WITH_YOUR_GOOGLE_EMAIL/$email/g" traefik.toml

sed -i "s/REPLACE_WITH_THE_MONGO_PASSWORD/$mongo_password/g" enable_backups.sh

sed -i "s/REPLACE_WITH_THE_API_PORT/$port/g" insapp-go/Dockerfile

sed -i "s/REPLACE_WITH_YOUR_GOOGLE_EMAIL/$email/g" insapp-go/config.json
sed -i "s/REPLACE_WITH_YOUR_GOOGLE_PASSWORD/$email_password/g" insapp-go/config.json
sed -i "s/REPLACE_WITH_THE_FIREBASE_KEY/$firebase_key/g" insapp-go/config.json
sed -i "s/REPLACE_WITH_THE_MONGO_PASSWORD/$mongo_password/g" insapp-go/config.json
sed -i "s/REPLACE_WITH_THE_ENVIRONMENT_TYPE/$environment/g" insapp-go/config.json
sed -i "s/REPLACE_WITH_THE_API_PORT/$port/g" insapp-go/config.json

sed -i "s/REPLACE_WITH_THE_HOST_DOMAIN/$domain/g" insapp-web/app/app.config.js
