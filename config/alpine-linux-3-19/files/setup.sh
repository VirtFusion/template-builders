#!/bin/sh

set -euxo pipefail

sed -ie "\$ahttp://dl-cdn.alpinelinux.org/alpine/v3.19/main" /etc/apk/repositories
sed -ie "\$ahttp://dl-cdn.alpinelinux.org/alpine/v3.19/community" /etc/apk/repositories
apk update
apk upgrade --available
apk add --no-cache py3-netifaces py3-pyserial cloud-init cloud-utils qemu-guest-agent e2fsprogs e2fsprogs-extra libblockdev lsblk parted sfdisk sgdisk eudev mount

setup-cloud-init

cloud-init status -l
cloud-init clean --logs
#cloud-init query userdata

rm -rf /etc/motd

echo "Welcome to Alpine!" > /etc/motd
echo "" >> /etc/motd

sed -i 's/#GA_PATH=.*$/GA_PATH="\/dev\/vport2p1"/' /etc/conf.d/qemu-guest-agent

rc-update add qemu-guest-agent
rc-service qemu-guest-agent restart

#sed -i "/datasource_list*/d" /etc/cloud/cloud.cfg
#echo "datasource_list: ['NoCloud', 'ConfigDrive']" > /etc/cloud/cloud.cfg

sed -i 's/dhcp/manual/g' /etc/network/interfaces
rm -rf /var/cache/apk/*
rm -rf /tmp/*
rm -rf /etc/ssh/*_key /etc/ssh/*_key.pub

if [[ -d /root/.ssh ]]; then
		rm -f /root/.ssh/authorized_keys
		echo -n > /root/.ssh/known_hosts
		chmod 0644 /root/.ssh/known_hosts
fi

passwd -d root
passwd -l root

find /var/log -type f | while read f; do echo -ne '' > ${f}; done;
echo -n > /root/.bash_history
echo -n > /root/.ash_history
echo -n > /etc/resolv.conf

dd if=/dev/zero of=/zeroed_file bs=1M oflag=direct || /bin/true
rm -rf /zeroed_file

sync