#!/bin/bash
# sets up a pre-commit hook to ensure that any Ansible Vaults are encrypted
#
# Combo of https://github.com/IronicBadger/infra and
# https://gist.github.com/leucos/a9f42e111a8cfc2ebf6e

if [ -d .git/ ]; then
  rm .git/hooks/pre-commit
  cp .git-pre-commit-hook.sh .git/hooks/pre-commit
  chmod +x .git/hooks/pre-commit

  echo "Installed pre-commit hook to ensure Ansible vaults are encrypted"
fi
