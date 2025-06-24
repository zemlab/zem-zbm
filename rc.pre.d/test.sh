#!/bin/sh

mkdir -p /etc/dropbear
for keytype in rsa ecdsa ed25519; do
    dropbearkey -t "${keytype}" -f "/etc/dropbear/dropbear_${keytype}_host_key"
done

curl -L https://github.com/ahesford/mkinitcpio-dropbear/archive/master.tar.gz | tar -zxvf - -C /tmp
mkdir -p /etc/zfsbootmenu/initcpio/{install,hooks}
cp /tmp/mkinitcpio-dropbear-master/dropbear_hook /etc/zfsbootmenu/initcpio/hooks/dropbear
cp /tmp/mkinitcpio-dropbear-master/dropbear_install /etc/zfsbootmenu/initcpio/install/dropbear
rm -r /tmp/mkinitcpio-dropbear-master