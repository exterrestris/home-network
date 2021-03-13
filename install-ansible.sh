#!/bin/bash
DISTRO=$( awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }' )
if [ -z $DISTRO ]; then
    echo "Unknown Linux distribtion"
    exit 1
fi

case $DISTRO in
    ubuntu)
        apt-add-repository --yes --update ppa:ansible/ansible
        apt install --yes python3 git make ansible-base
        ;;
    *)
        echo "Unsupported Linux distribution: $DISTRO"
        exit 1
esac

echo "Ansible installed"
