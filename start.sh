#!/bin/bash

PS3="Desea quitar aviso suscripcion proxmox? "
select suscripcion in SI NO
do
	break;
done
if [ "$suscripcion" = "SI" ]; then

  cp /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js.old
  sed 's/if (data.status !== 'Active') {/if (false) {/' /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js
  systemctl restart pveproxy.service


echo "suscripcion quitada."
echo ""
echo ""
echo ""

	
fi

PS3="Desea hacer update ? "	
select update in SI NO
do
	break;
done
if [ "$update" = "SI" ]; then	
	
	apt-get update
clear
echo "update realizado con exito."
echo ""
echo ""
echo ""
echo ""

fi
