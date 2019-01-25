#!/usr/bin/env bash

# Automate basic Arch Linux install steps

# You are expected to complete the following step manually PRIOR to running this script.

# ASSUMPTIONS
# - You booted from an Arch Linux USB flash drive.
# - Network up (ex: wifi-menu)
# - UEFI is assumed.  If not, change the partitions and GRUB commands.
# - Intel CPU and graphics are assumed.
# - You have a drive identified as /dev/sda with 3 formatted partitions:
#   - Partition 1: up to 500MB (550MB MAX), Type: EFI
#   - Partition 2: 4GB (or so), Type: Linux Swap
#   - Partition 3: (Root), Type: Linux EXT4


### BEGIN ###


# Sync time
timedatectl set-ntp true

# Format Partitions (here for reference)
# mkfs.fat -F32 /dev/sda1
# mkfs.ext4 -F /dev/sda3
# mkswap /dev/sda2
# swapon /dev/sda2

# Mount partitions (here for reference)
# mount /dev/sda3 /mnt
# mkdir -p /mnt/efi
# mount /dev/sda1 /mnt/efi

# Pacstrap the system
pacstrap /mnt base base-devel vim networkmanager intel-ucode grub efibootmgr

# Generate the fstab
genfstab -U /mnt >>/mnt/etc/fstab

# Chroot the system
arch-chroot /mnt

# Set Locale and Language
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
sed -i "s/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g" /etc/locale.gen

echo LANG=en_US.UTF-8 > /etc/locale.conf
cat <<EOF > /etc/hosts
127.0.0.1    localhost
::1          localhost
127.0.1.1    $NEW_HOSTNAME.localdomain $NEW_HOSTNAME
EOF

echo $HOSTNAME > /etc/hostname

# Set Root password
echo Set Root Password
passwd

# Install GRUB
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --removable
grub-mkconfig -o /boot/grub/grub.cfg

# Cleaning up
exit
umount /mnt/efi && umount /mnt
echo Done.