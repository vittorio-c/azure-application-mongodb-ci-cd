# azure-application-mongodb-ci-cd

## TODO

- Migrer la bdd MongoDB sur Azure
- Remplir la BDD avec des données
- Paramètrer le déploiement continue de l'app dans Azur Devops
- Sécuriser la BDD :  à voir
- Amélioration du frontend (en option du JS + intégration continue)
- Sécurité : DMZ à voir

## TODO détails

**Migrer la bdd MongoDB sur Azure** : Steeve éventuellement
- Créer l'instance MongoDB sur Azure
- Récupérer les identifiants de connexion
- Insérer les identifiants dans le code source

**Migrer la BDD avec des données**  : Steeve, Sophie en support
- Récupérer les données de la base Atlas
- Les injecter dans la nouvelle base Azur

**Paramètrer le déploiement continue de l'app dans Azur Devops** : Sophie en support, Vittorio
- Rattacher le compte Azur au compte Azur Devops
- Rattacher le pipeline au repo Github
- Paramètrer la construction du build
- Paramètrer la fréquence de déploiement

**Amélioration du frontend** : Sophie
- todo

**Sécurité** : Yohan
- todo

**Gestion du repo** : Vittorio
- todo

**Installation d'un serveur web pour traitement des requêtes**

**Création d'une VM qui recevra l'application**

## Doc

"Create a Linux virtual machine scale set with an ARM template" :
- <https://docs.microsoft.com/en-us/azure/virtual-machine-scale-sets/quick-create-template-linux>

## Commandes de création de resources

#### Create a resource group
az group create --name cinema-mongodb --location westeurope

#### Deploy template into resource group

az deployment group create \
    --resource-group cinema-mongodb \
    --template-uri https://raw.githubusercontent.com/vittorio-c/azure-application-mongodb-ci-cd/vittorio/infra/vm_scale_set/template.json

## Todo

### Infra

- [x] Mise en place du scaleset derrière un loadBalancer
- [ ] Ajouter une instance MongoDB
- [ ] Gérer la connexion à la BDD depuis le scaleset
- [ ] Ajouter le scaleset au pipeline de déploiement
- [x] Ajouter la règle d'équilibrage de charge 80 --> 5000
- [x] Ajouter la sonde d'intégrité
