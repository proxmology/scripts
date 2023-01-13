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
    echo ""
    echo ""
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
    echo ""
    echo ""
fi
PROC=$(grep vendor_id /proc/cpuinfo | uniq | cut -d' ' -f2)
echo ""
echo ""
echo " tu procesador es: $PROC"
echo ""
echo ""
if [[ $1 = AuthenticAMD ]]
then
echo "usa CPU AMD, habilitando IOMMU"
               echo "iommu=pt" >> /etc/default/grub
               #update-grub
               #reboot 
               echo "realizado en AMD"
  else [[ $1 = GenuineIntel ]] 
               echo "usa CPU INTEL, habilitando IOMMU"
               echo "intel_iommu=on" >> /etc/default/grub
               #update-grub
               #reboot 
               echo "realizado en INTEL"
 fi

