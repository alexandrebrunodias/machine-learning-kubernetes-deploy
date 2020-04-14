#!/usr/bin/env bash

kubectl apply -f flasksklearn-deployment.yml &&\
    kubectl apply -f flasksklearn-service.yml

kubectl get pods

echo
echo "FLASKSKELARN URL: $(minikube service flasksklearn-service --url)"