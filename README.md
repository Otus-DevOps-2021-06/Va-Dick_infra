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
