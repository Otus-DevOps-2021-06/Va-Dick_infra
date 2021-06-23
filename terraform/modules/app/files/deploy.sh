#!/bin/bash
set -e

PORT="27017"
IP_ADDR=$1
if [ -z "$IP_ADDR" ]; then
   IP_ADDR="127.0.0.1"
fi
DATABASE_URL=$IP_ADDR":"$PORT

APP_DIR=$HOME
sudo apt-get install -y git
git clone -b monolith https://github.com/express42/reddit.git $APP_DIR/reddit
cd $APP_DIR/reddit
bundle install


sudo cat > /etc/systemd/system/puma.service <<EOF
[Unit]
Description=Puma HTTP Server
After=network.target

[Service]
Environment="DATABASE_URL=${DATABASE_URL}"
Type=simple
WorkingDirectory=$APP_DIR/reddit
ExecStart=/bin/bash -lc 'puma'
Restart=always

[Install]
WantedBy=multi-user.target
EOF

sudo chmod +x /etc/systemd/system/puma.service

sudo systemctl start puma
sudo systemctl enable puma
