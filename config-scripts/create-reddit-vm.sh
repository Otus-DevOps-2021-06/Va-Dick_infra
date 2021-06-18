#!/bin/bash

yc compute instance create \
  --name reddit-full-vm \
  --hostname reddit-app \
  --memory=2 \
  --create-boot-disk size=10,image-family=reddit-full \
  --zone ru-central1-a \
  --public-ip \
  --ssh-key ~/.ssh/id_rsa.pub
