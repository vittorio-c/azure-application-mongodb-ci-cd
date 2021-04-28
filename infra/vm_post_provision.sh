#!/usr/bin/env bash

# TODO
# changer le nom de l'user pour coller à celui utilisé dans le template des VMs scale

# TODO
# cloner le repo

# packages needed to install and compile uwsgi
sudo apt-get update
sudo apt install software-properties-common
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update
sudo apt install -y python3.8
sudo apt install -y python3.8-venv
sudo apt-get install -y gcc build-essential python3.8-dev libpcre3 libpcre3-dev
sudo apt install -y python3.8-distutils

# install Pip
cd ~
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python3.8 get-pip.py

# python env working directory
sudo -i -u azureuser bash << EOF
rm -rf ~/MongoDbCinema
mkdir -p ~/MongoDbCinema
cd ~/MongoDbCinema
python3 -m venv env
source env/bin/activate
pip install wheel
pip install uwsgi flask
deactivate
cd
EOF

# activate uwsgi service
sudo tee -a /etc/systemd/system/mongocinema.service > /dev/null << EOF
[Unit]
Description=uWSGI instance to serve MongoDbCinema
After=network.target

[Service]
User=azureuser
Group=www-data
WorkingDirectory=/home/azureuser/MongoDbCinema
Environment="PATH=/home/azureuser/MongoDbCinema/env/bin"
ExecStart=/home/azureuser/MongoDbCinema/env/bin/uwsgi --ini uwsgi.ini

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl start mongocinema
sudo systemctl enable mongocinema

