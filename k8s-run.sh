#!/bin/sh

NS=rsocket
kubectl delete ns $NS
kubectl create ns $NS
kubectl config set-context $(kubectl config current-context) --namespace=$NS


kubectl apply -f yaml/k8s/deployment-broker.yml
sleep 5
kubectl apply -f yaml/k8s/service.yml
kubectl apply -f yaml/k8s/