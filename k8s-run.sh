#!/bin/sh

kubectl delete ns rsocket
kubectl create ns rsocket
kubectl config set-context $(kubectl config current-context) --namespace=rsocket


kubectl apply -f yaml/k8s/deployment-broker.yaml
sleep 5
kubectl apply -f yaml/k8s/
