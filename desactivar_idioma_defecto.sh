#!/usr/bin/env bash
# Desactivar el idioma por defecto
    echo ""
    echo ""

if [ -f "/etc/apt/apt.conf.d/30desdability-lang" ];then

    echo "-------------------------------------------"
    echo "* El idioma por defecto ya esta desactivado *"
    echo "-------------------------------------------"

    echo ""
    echo ""
else

    echo -e "Acquire::Languages \"none\"; Acquire::IndexTargets::deb::Contents-deb::DefaultEnabled \"false\";\\n" > /etc/apt/apt.conf.d/30desdability-lang

    echo "------------------------------------------"
    echo "* El idioma por defecto se ha desactivado *"
    echo "------------------------------------------"

    echo ""
    echo ""
    echo "Reinicia proxmox para aplicar el cambio"
    echo ""
    echo ""
fi
