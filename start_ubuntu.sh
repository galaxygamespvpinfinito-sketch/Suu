#!/bin/sh

# The path of Ubuntu rootfs
UBUNTUPATH="/data/data/com.termux/files/home/ubuntu"

# Fix setuid issue
busybox mount -o remount,dev,suid /data

busybox mount --bind /dev $UBUNTUPATH/dev
busybox mount --bind /sys $UBUNTUPATH/sys
busybox mount --bind /proc $UBUNTUPATH/proc
busybox mount -t devpts devpts $UBUNTUPATH/dev/pts

# /dev/shm for Electron apps
mkdir -p $UBUNTUPATH/dev/shm
busybox mount -t tmpfs -o size=256M tmpfs $UBUNTUPATH/dev/shm

# Mount sdcard
busybox mount --bind /sdcard $UBUNTUPATH/sdcard

# chroot into Ubuntu
busybox chroot $UBUNTUPATH /bin/su - root
