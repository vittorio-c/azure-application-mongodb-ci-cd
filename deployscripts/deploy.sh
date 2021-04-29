#!/usr/bin/env bash

sudo -i -u azureuser bash << EOF
echo "In"
whoami

# Suppression de l'ancienne version de l'application
rm -rf ~/MongoDbCinema

# Copie de la nouvelle version depuis l'artefact crée lors du CI
cp -r /VSTSAgent/_work/r1/a/_vittorio-c.azure-application-mongodb-ci-cd/movies-app-files/ ~/MongoDbCinema
cd ~/MongoDbCinema

# Setup de l'application
python3.8 -m venv env
source env/bin/activate
pip3.8 install wheel
pip3.8 install -r requirements.txt
EOF
echo "Out"

# we restart server to take changes into account
sudo systemctl restart mongocinema
