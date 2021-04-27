#!/usr/bin/env bash

sudo -i -u azureuser bash << EOF
echo "In"
whoami

rm -rf ~/MongoDbCinema

cp -r /VSTSAgent/_work/r1/a/_vittorio-c.azure-application-mongodb-ci-cd/movies-app-files/ ~/MongoDbCinema
cd ~/MongoDbCinema

deactivate
python3 -m venv env
source env/bin/activate

pip install wheel
pip install -r requirements.txt
EOF
echo "Out"

# # we restart server to take changes into account
# sudo systemctl restart statsapp

echo 'Salut' > /home/azureuser/salut.txt
