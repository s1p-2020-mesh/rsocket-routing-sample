#!/bin/sh

kubectl delete ns rsocket-scaled
kubectl create ns rsocket-scaled
kubectl config set-context $(kubectl config current-context) --namespace=rsocket-scaled

kubectl apply -f yaml/k8s-scaled/service.yml
kubectl apply -f yaml/k8s-scaled/deployment-broker1.yml
sleep 5
kubectl apply -f yaml/k8s-scaled/deployment-broker2.yml
sleep 5
kubectl apply -f yaml/k8s-scaled/deployment-broker3.yml
sleep 5
kubectl apply -f yaml/k8s-scaled/deployment-clients.yml