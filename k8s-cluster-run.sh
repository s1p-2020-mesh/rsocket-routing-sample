#!/bin/sh

NS=rsocket-cluster
kubectl delete ns $NS
kubectl create ns $NS
kubectl config set-context $(kubectl config current-context) --namespace=$NS

# Deploy broker cluster config
kubectl apply -f yaml/k8s-cluster/broker-cluster-config.yml

# Deploy broker cluster
kubectl apply -f yaml/k8s-cluster/no-kustomize/broker1.yml && sleep 10
kubectl apply -f yaml/k8s-cluster/no-kustomize/broker2.yml && sleep 10
kubectl apply -f yaml/k8s-cluster/no-kustomize/broker3.yml && sleep 10

# Deploy broker cluster svc for clients
kubectl apply -f yaml/k8s-cluster/broker-service-for-clients.yml

# Deploy clients
kubectl apply -f yaml/k8s-cluster/deployment-clients.yml
