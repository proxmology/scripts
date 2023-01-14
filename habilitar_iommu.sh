#!/usr/bin/env bash

# Check if IOMMU is already enabled
if [ -e /sys/kernel/iommu_groups/0/devices/0000:00:00.0 ]; then
    echo "IOMMU is already enabled"
    exit 0
fi

# Get CPU information
CPU_VENDOR=$(cat /proc/cpuinfo | grep vendor_id | head -n1 | awk '{print $3}')

# Enable IOMMU for AMD CPUs
if [ "$CPU_VENDOR" == "AuthenticAMD" ]; then
    echo "AMD CPU detected, enabling IOMMU"
    echo "iommu=pt" >> /etc/default/grub
    update-grub
    reboot
# Enable IOMMU for Intel CPUs
elif [ "$CPU_VENDOR" == "GenuineIntel" ]; then
    echo "Intel CPU detected, enabling IOMMU"
    echo "intel_iommu=on" >> /etc/default/grub
    update-grub
    reboot
else
    echo "Unsupported CPU vendor"
    exit 1
fi
