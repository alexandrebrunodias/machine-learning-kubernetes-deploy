#!/usr/bin/env bash

kubectl apply -f flasksklearn-deployment.yml

kubectl get pods

kubectl port-forward $(kubectl get pods | grep flasksklearn-deployment | cut -d' ' -f1) 8000:80