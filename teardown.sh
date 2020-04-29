#!/usr/bin/env bash

kubectl delete -f internal-service-config.yaml
kubectl delete -f sampleapp-secret.yaml
kubectl delete -f <(istioctl kube-inject -f geekjoke-manifest.yaml)
kubectl delete -f <(istioctl kube-inject -f dadjoke-manifest.yaml)
kubectl delete -f <(istioctl kube-inject -f joke-manifest.yaml)
kubectl delete -f <(istioctl kube-inject -f about-manifest.yaml)
kubectl delete -f <(istioctl kube-inject -f location-manifest.yaml)
kubectl delete -f <(istioctl kube-inject -f sample-app-manifest.yaml)
kubectl delete ns dev