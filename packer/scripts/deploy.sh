#!/bin/bash


# Переменные
PROJECTS_DIR="/etc/projects/"
PROJECT_FOLDER_NAME="reddit"
FULL_PROJECT_DIR=${PROJECTS_DIR}${PROJECT_FOLDER_NAME}"/"


# Выполнение команд
apt-get update
apt-get install -y git
mkdir -p $PROJECTS_DIR
cd $PROJECTS_DIR && sudo git clone -b monolith https://github.com/express42/$PROJECT_FOLDER_NAME.git
cd $FULL_PROJECT_DIR && bundle install


sudo cat > /etc/systemd/system/puma.service <<EOF
[Unit]
Description=Puma service
[Service]
Type=simple
WorkingDirectory=$FULL_PROJECT_DIR
ExecStart=/usr/local/bin/puma
TimeoutSec=300
Restart=always
[Install]
WantedBy=multi-user.target
EOF


sudo systemctl start puma
sudo systemctl enable puma

