#!/bin/bash
function exec_command {
  echo "----------------------------------------------------------------------------------------------------"
  echo $1
  eval $1
  echo "----------------------------------------------------------------------------------------------------"
  sleep 1
}

exec_command "wget -qO - http://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -"
exec_command "echo \"deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse\" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list"
exec_command "apt-get update"
exec_command "apt-get install -y mongodb-org"
exec_command "systemctl start mongod"
exec_command "systemctl enable mongod"
exec_command "systemctl status mongod"
