#!/bin/bash
DISTRO=$( awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }' )
if [ -z $DISTRO ]; then
    echo "Unknown Linux distribtion"
    exit 1
fi

case $DISTRO in
    ubuntu)
        sudo apt update
        sudo apt install --yes python3 python3-venv python3-pip python3-bcrypt git make sshpass
        python3 -m pip install --user pipx
        pipx install --include-deps ansible
        pipx inject --include-apps ansible argcomplete
        export PATH=~/.local/bin:$PATH
        grep -qxF 'export PATH=~/.local/bin:$PATH' ~/.bashrc || echo -n 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc
        ;;
    *)
        echo "Unsupported Linux distribution: $DISTRO"
        exit 1
esac

ansible --version
