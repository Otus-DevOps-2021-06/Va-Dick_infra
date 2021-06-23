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
- Main task (Creating an instance using terraform)
- Independent task (Defining variables for the private SSH key and setting the zone)
- Task with * * (Creating a load balancer using terraform), file `lb.tf`
- Task with ** (Creating a second instance using terraform and checking the load balancer)
- Task with ** (Implemented an approach with setting the number of instances via the count resource parameter)




---
# Terraform-2
Done:
- Create separate modules for app, db, vpc;
- Task with* (creating backends for storing state files)
- Task with** (Adding provizgenerov, for automatic deployment of applications)
