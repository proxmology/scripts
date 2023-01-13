#!/usr/bin/env bash

echo "buscando si ya tiene iommu AMD"
echo ""
existe=` grep -l iommu=pt /etc/default/grub | wc -l`
if [ $existe -gt 0 ];then
    echo ""
    echo ""
    echo "Encontrado"
    exit

else

    echo "NO encontrado"

fi

echo "buscando si ya tiene iommu INTEL"
echo ""
existe=` grep -l intel_iommu=on /etc/default/grub | wc -l`
if [ $existe -gt 0 ];then
    echo ""
    echo ""
    echo "Encontrado"
    exit

else

    echo "NO encontrado"

fi

    echo ""
    echo ""

while true; do
    read -p "INSTALAR IOMMU?
    1 AMD
    2 INTEL
    3 SALIR

Elige una opcion?"  PROCESADOR
    case $PROCESADOR in

        [1]* ) echo "usa CPU AMD, habilitando IOMMU"
               echo "iommu=pt" >> /etc/default/grub
               update-grub
               reboot 
               echo "realizado"; break;;

        [2]* ) echo "usa CPU INTEL, habilitando IOMMU"
               echo "intel_iommu=on" >> /etc/default/grub
               update-grub
               reboot 
               echo "realizado"; break;;

        [3]* ) echo "Opción Seleccionada exit !"
               exit; break;;

        * ) echo "Seleccione una Opción deco usb hdd.";;
    esac
done
