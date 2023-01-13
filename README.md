## Proxmox


- Script quitar cartel suscripcion proxmox:
```
bash -c "$(wget -qLO - https://raw.githubusercontent.com/proxmology/proxmox/main/start.sh)"
```

- Script para activar Wake On Lan en un cluster (hay que hacerlo nodo por nodo excepto el principal)
```
bash -c "$(wget -qLO - https://raw.githubusercontent.com/proxmology/proxmox/main/wol.sh)"
```
