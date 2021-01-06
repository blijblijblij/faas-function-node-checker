# faas-function-node-checker

Add faas function to verify whether nodes are unavailable 
and scale down deployments running on those node(s)

## env
For the github actions to work we need to add the following
secrets to github:

```
DOCKER_USERNAME
DOCKER_PASSWORD
OPENFAAS_USERNAME
OPENFAAS_PASSWORD
OPENFAAS_GATEWAY
```
