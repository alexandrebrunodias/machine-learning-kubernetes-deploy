#!/usr/bin/env bash

kubectl apply -f flasksklearn-deployment.yml
# kubectl apply -f flasksklearn-service.yml

kubectl get pods

# echo
# echo "The application URL is " $(minikube service flasksklearn-service --url)
# echo

kubectl expose deployment flasksklearn-deployment --port=8080 --target-port=80