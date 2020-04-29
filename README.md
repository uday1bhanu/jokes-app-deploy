# jokes-app-deploy
Jokes app deployment

Setup scripts required for Tracing POC

# Prerequisite
* Kubrernetes cluster
* Kubectl configured with access to a cluster

# Setup
* kubectl apply -f istio-tracing-kiali.yaml
* ./setup

# Teardown
* ./teardown
* kubectl delete -f istio-tracing-kiali.yaml