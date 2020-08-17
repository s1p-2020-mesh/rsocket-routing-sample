#!/bin/sh

kubectl delete ns rsocket
kubectl create ns rsocket
kubectl config set-context $(kubectl config current-context) --namespace=rsocket


kubectl apply -f yaml/k8s/