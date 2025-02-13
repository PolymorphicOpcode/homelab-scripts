```sh
LUDUS_API_KEY='blah' 
ludus --user GOADUserBlah range config set -f ./config.yml
ludus --user GOADUserBlah range deploy
ludus --user GOADUserBlah range logs -f
```

Ensure that ludus and GOAD users both have PVE Datastore Admin on the local-lvm, if you're like me and didn't configure local-lvm to be vm storage at install
proxmox_vm_storage_format: raw, if you try qcow2 it won't work

### Ludus User Creation (Linux PAM on PVE Dashboard)

root@prox:~# LUDUS_API_KEY='ROOT.blahblah' \
> ludus user add --name "sam" --userid sam --admin --url https://127.0.0.1:8081

### Config Changes

```sh
systemctl restart ludus-admin
systemctl restart ludus
```