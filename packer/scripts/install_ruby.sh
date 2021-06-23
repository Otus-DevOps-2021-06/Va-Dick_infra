#!/bin/bash
function exec_command {
  echo "----------------------------------------------------------------------------------------------------"
  echo $1
  eval $1
  echo "----------------------------------------------------------------------------------------------------"
  sleep 1
}


exec_command "apt update"
exec_command "apt install -y ruby-full ruby-bundler build-essential"
