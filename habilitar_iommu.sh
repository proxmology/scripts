#!/usr/bin/env bash

# Comprobar si IOMMU ya está habilitado
if [ -e /sys/kernel/iommu_groups/0/devices/0000:00:00.0 ]; then
    echo "IOMMU ya está habilitado"
    exit 0
fi

# Obtener información de la CPU
CPU_VENDOR=$(cat /proc/cpuinfo | grep vendor_id | head -n1 | awk '{print $3}')

# Habilitar IOMMU para CPUs AMD
if [ "$CPU_VENDOR" == "AuthenticAMD" ]; then
    echo "Se ha detectado una CPU AMD, habilitando IOMMU"
    echo "iommu=pt" >> /etc/default/grub
    update-grub
    reboot
# Habilitar IOMMU para CPUs Intel
fi
if [ "$CPU_VENDOR" == "GenuineIntel" ]; then
    echo "Se ha detectado una CPU Intel, habilitando IOMMU"
    GRUB_CMDLINE_LINUX_DEFAULT="quiet iommu=pt intel_iommu=on pcie_acs_override=downstream"
    sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT=.*/GRUB_CMDLINE_LINUX_DEFAULT='$GRUB_CMDLINE_LINUX_DEFAULT'/g" /etc/default/grub
    echo "#By JuanLuSoft" >> /etc/modules
    echo "vfio" >> /etc/modules
    echo "vfio_iommu_type1" >> /etc/modules
    echo "vfio_pci" >> /etc/modules
    echo "vfio_virqfd" >> /etc/modules
    update-grub
    reboot
else
    echo "No se ha detectado una CPU compatible para habilitar IOMMU"
fi
