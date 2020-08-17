#!/bin/sh

kubectl delete ns rsocket-istio
kubectl create ns rsocket-istio
kubectl label namespace rsocket-istio istio-injection=enabled
kubectl config set-context $(kubectl config current-context) --namespace=rsocket-istio


kubectl apply -f yaml/istio/