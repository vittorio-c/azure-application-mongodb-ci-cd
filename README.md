# About

This student collaborative project deploys a Flask/MongoDB application into Microsoft Azure cloud.

It uses Azure ARM templates to deploy a VM Scale Set (`./infra/vm_scale_set/template.json`), a load balancer (`./infra/load_balancer.json`) and a MongoDB instance (`./infra/mongodb.json`).

Is uses a `./infra/vm_post_provision.sh` script to apply some command on VMs after deployment is done.

It uses a `deploy.sh` script to deploy the app into the VMs when new changes are pushed to the repository, via Azure Devops CI/CD.

# Commands

## Create a resource group

`az group create --name cinema-mongodb --location westeurope`

## Deploy template into resource group

```
az deployment group create \
    --resource-group cinema-mongodb \
    --template-uri https://raw.githubusercontent.com/vittorio-c/azure-application-mongodb-ci-cd/vittorio/infra/vm_scale_set/template.json
```

# Doc

"Create a Linux virtual machine scale set with an ARM template" :
- <https://docs.microsoft.com/en-us/azure/virtual-machine-scale-sets/quick-create-template-linux>


# Todo

## Infra

- [x] Mise en place du scaleset derrière un loadBalancer
- [ ] Ajouter une instance MongoDB
- [ ] Gérer la connexion à la BDD depuis le scaleset
- [ ] Ajouter le scaleset au pipeline de déploiement
- [x] Ajouter la règle d'équilibrage de charge 80 --> 5000
- [x] Ajouter la sonde d'intégrité
