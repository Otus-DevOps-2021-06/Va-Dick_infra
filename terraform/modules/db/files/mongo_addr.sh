#!/bin/bash

PORT="27017"
IP_ADDR=$1

if [ -z "$IP_ADDR" ]; then
   IP_ADDR="127.0.0.1"
fi

sudo cat > /etc/mongod.conf <<EOF
# mongod.conf

# for documentation of all options, see:
#   http://docs.mongodb.org/manual/reference/configuration-options/

# Where and how to store data.
storage:
  dbPath: /var/lib/mongodb
  journal:
    enabled: true

# where to write logging data.
systemLog:
  destination: file
  logAppend: true
  path: /var/log/mongodb/mongod.log

# network interfaces
net:
  port: $PORT
  bindIp: $IP_ADDR


# how the process runs
processManagement:
  timeZoneInfo: /usr/share/zoneinfo
EOF

systemctl stop mongod
systemctl start mongod
systemctl enable mongod