#!/usr/bin/env bash

c=`kubectl get ns | grep dev | awk '{print $1}' | wc -l`

echo c = $c

if [ ${c} -eq 1 ]; then 
    echo dev namespace already exists
else 
    echo creating dev namespace
    kubectl create ns dev
    sleep 1
fi

kubectl apply -f internal-service-config.yaml
kubectl apply -f app-secret.yaml

kubectl apply -f <(istioctl kube-inject -f geekjoke-manifest.yaml)
sleep 20
kubectl apply -f <(istioctl kube-inject -f dadjoke-manifest.yaml)
sleep 20
kubectl apply -f <(istioctl kube-inject -f joke-manifest.yaml)
sleep 20
kubectl apply -f <(istioctl kube-inject -f about-manifest.yaml)
sleep 20
kubectl apply -f <(istioctl kube-inject -f location-manifest.yaml)