#!/usr/bin/env bash

dockerpath=alexdias/flasksklearn

echo "Docker ID and Image: $dockerpath"

docker login &&\
    docker image tag flasksklearn $dockerpath

docker image push $dockerpath