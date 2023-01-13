#!/bin/bash

# Instalar paquetes necesarios
apt-get update
apt-get install -y ethtool

# Obtener lista de interfaces de red
interfaces=$(ip -o link show | awk '{print $2}' | tr -d :)

# Seleccionar interfaz de red
interface=$(echo $interfaces | awk '{print $1}')

# Habilitar Wake-on-LAN
ethtool -s $interface wol g

# Comprobar si el comando anterior se ejecutó correctamente
if [ $? -ne 0 ]; then
  echo "Error al habilitar Wake-on-LAN en la interfaz $interface"
  exit 1
fi

# Obtener dirección MAC de la interfaz seleccionada
mac=$(ip link show $interface | awk '/ether/ {print $2}')

# Configurar Wake-on-LAN en el nodo Proxmox
pvenode config set --wakeonlan $mac

# Comprobar si el comando anterior se ejecutó correctamente
if [ $? -ne 0 ]; then
  echo "Error al configurar Wake-on-LAN en el nodo con la dirección MAC $mac"
  exit 1
fi

echo "Wake-on-LAN habilitado correctamente en la interfaz $interface con la dirección MAC $mac"
