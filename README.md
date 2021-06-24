# Va-Dick_infra
Va-Dick Infra repository




---
# Cloud-testapp
```
testapp_IP = 217.28.228.50
testapp_port = 9292
```




---
# Cloud-bastion

## Independent task №1

Connecting to the "someinternalhost" VM via the "bastion" VM in a single command:
```
ssh -J appuser@178.154.255.227 appuser@10.128.0.6
```

## Additional task №1
For a simplified connection, you can create a config file:
```
# Example for linux/mac os system
cat <<EOF> ~/.ssh/config
Host bastion
    HostName ${bastion_public_ip}
    User appuser

Host someinternalhost
    HostName ${someinternalhost_local_ip}
    User appuser
    ProxyJump bastion
EOF
```

## IP:
```
bastion_IP = 178.154.255.227
someinternalhost_IP = 10.128.0.6
```



---
# Packer

Main task (creating an image using a template)
```
packer build -var-file=./packer/variables.json ./packer/ubuntu16.json
```
Additional task (Building a bake image)
```
packer build -var-file=./packer/variables.json ./packer/immutable.json
```
Additional task (Automating the creation of a virtual machine)
```
config-scripts/create-reddit-vm.sh
```


---
# Terraform-1
Done:
- Main task (Creating an instance using terraform);
- Independent task (Defining variables for the private SSH key and setting the zone);
- Task with ** (Creating a load balancer using terraform), file `lb.tf`;
- Task with ** (Creating a second instance using terraform and checking the load balancer);
- Task with ** (Implemented an approach with setting the number of instances via the count resource parameter);




---
# Terraform-2
Done:
- Create separate modules for app, db, vpc;
- Task with* (creating backends for storing state files);
- Task with** (Adding provizgenerov, for automatic deployment of applications);




---
# Ansible-1
Done:
- Main task (Created inventory files, ansible. cfg, clone playbook.yml);
- Task with * (Created by inventory.json and script main.py to work with it);
```
#List of all instances:
python3 main.py --sa-json-path="/path/to/key.json" --folder-id="***" --list

#Specific instance:
python3 main.py --sa-json-path="/path/to/key.json" --folder-id="***" --host HOST

#Get information on all commands:
python3 main.py --help
```



---
# Ansible-2
Done:
- Main task (Created inventory files: reddit_app_multiple_plays.yml, reddit_app_one_play.yml);
- Splitting files by tags (files: app.yml, db.yml, deploy.yml);
- Creating poker_app.yml packer_db files.yml for provisioners in packer.




---
# Ansible-3
Done:
- Transferred the created playbooks to separate roles
- Description of two environments (stage and prod)
- Adding the nginx role community
- Adding a role for creating users (using Ansible Vault for data encryption)
- Working with dynamic inventory (creating separate scripts for generating inventory in prod and stage environments):

```
#Example of running a script in a stage environment

python3 ansible/environments/stage/main.py --sa-json-path="/path/to/key.json" --folder-id="***" --list

python3 ansible/environments/stage/main.py --sa-json-path="/path/to/key.json" --folder-id="***" --host HOST
```



---
# Ansible-4
Done:
- Local development using Vagrant, refinement of roles for provisioning in Vagrant;
- Testing roles using Molecule and Testinfra;
- Switching the image collection by the packer to the use of roles;

Для запуска билда образов db и app, необходимо воспользоваться командой:
```
packer build --var-file="./packer/variables.json" ./packer/app.json
packer build --var-file="./packer/variables.json" ./packer/db.json
```

To build a project using vagrant:
```
cd ansible && vagrant up

# To delete:
vagrant destroy -f
```

To run db role testing via molecule:
```
cd ./ansible/roles/db && molecule create
molecule converge
molecule verify

# To delete:
molecule destroy --all
```
