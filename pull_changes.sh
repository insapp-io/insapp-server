#!/usr/bin/env bash

# Stop running containers
docker-compose stop

# Pull changes for each submodule
git pull origin master && git submodule foreach git pull origin master

# Build images and launch them
docker-compose build
docker-compose up -d

echo "Changes from master have been successfully pulled."
