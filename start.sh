#!/usr/bin/env bash
function header_info {
cat <<"EOF"

 ____                           ___  _
|  _ \ _ __ _____  ___ __ ___  / _ \| | ___   __ _ _   _ 
| |_) | '__/ _ \ \/ / '_ ` _ \| | | | |/ _ \ / _` | | | |
|  __/| | | (_) >  <| | | | | | |_| | | (_) | (_| | |_| |
|_|   |_|  \___/_/\_\_| |_| |_|\___/|_|\___/ \__, |\__, |
                                             |___/ |___/ 
                                             
                                             
EOF
}
clear
header_info



txtrst=$(tput sgr0) 
txtred=$(tput setab 1) 
textpurple=$(tput setab 5) 
txtgreen=$(tput bold ; tput setaf 2)


PS3="${txtgreen}Desea quitar cartel suscripcion proxmox? ${txtrst}"
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
PS3="${txtgreen}Desea hacer update ? ${txtrst}"
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
