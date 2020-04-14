#!/usr/bin/env bash

docker build -t flasksklearn ../

# List docker images
docker image ls

# Run flask app
docker run -p 8000:80 flasksklearn