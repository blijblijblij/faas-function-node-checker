# faas-function-node-checker

A faas function (written in ruby) to verify whether nodes are unavailable and scale down deployments running on those node(s)

## env
For the github actions to work we need to add the following
secrets to github:

```
# a github personal access token to push to ghcr.io, github's container registry
CR_PAT

# docker credentials for pushing to docker hub
DOCKER_USERNAME
DOCKER_PASSWORD

# faas env settings to interact with the faas endpoint
OPENFAAS_USERNAME
OPENFAAS_PASSWORD
OPENFAAS_GATEWAY
```

