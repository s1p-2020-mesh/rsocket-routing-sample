#!/bin/sh

NS=rsocket-cluster-kmz
kubectl delete ns $NS
kubectl create ns $NS
kubectl config set-context $(kubectl config current-context) --namespace=$NS

# Deploy broker cluster config
kubectl apply -f yaml/k8s-cluster/broker-cluster-config.yml

# Deploy broker cluster
kustomize build --load_restrictor none yaml/k8s-cluster/kustomize/overlays/broker1/ | kubectl apply -f -
sleep 10
kustomize build --load_restrictor none yaml/k8s-cluster/kustomize/overlays/broker2/ | kubectl apply -f -
sleep 10
kustomize build --load_restrictor none yaml/k8s-cluster/kustomize/overlays/broker3/ | kubectl apply -f -
sleep 10

# Deploy broker cluster svc for clients
kubectl apply -f yaml/k8s-cluster/broker-service-for-clients.yml

# Deploy clients
kubectl apply -f yaml/k8s-cluster/deployment-clients.yml
