#!/bin/bash
./install-ansible.sh
chmod 775 .
make install-git-hooks
make reqs
cat '*REPLACE WITH VAULT PASSWORD*' > .vault-password
nano .vault-password
make wsl
