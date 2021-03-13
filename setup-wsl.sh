#!/bin/bash
if [ ! -e /etc/wsl.conf ]; then
  sudo cp wsl.conf.default /etc/wsl.conf
  DRIVES=$(wmic.exe logicaldisk get deviceid | cut -d: -f1 -s | tr '[:upper:]' '[:lower:]')
  GID=$(id -g)
  DIR=$PWD
  cd /
  for drive in $DRIVES; do
    if [ -e /mnt/$drive ]; then
      sudo umount /mnt/$drive
      sudo mount -t drvfs $drive: /mnt/$drive -o metadata,uid=$UID,gid=$GID,umask=22
    fi
  done
  cd $DIR
fi
chmod +x install-ansible.sh
./install-ansible.sh
chmod 775 .
make install-git-hooks
make reqs
if [ ! -e .vault-password ]; then
  echo '*REPLACE WITH VAULT PASSWORD*' > .vault-password
fi
nano .vault-password
chmod -x .vault-password
make wsl
