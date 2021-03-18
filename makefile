spacedock memory-alpha memory-beta argus-array:
	ansible-playbook -b linux.yaml --limit $(subst -,_,$@) --skip-tags "setup" --vault-password-file .vault-password

test-machines holosuite-1 holosuite-2:
	ansible-playbook -b linux.yaml --limit $(subst -,_,$@) --skip-tags "setup" --vault-password-file .vault-password

wsl:
	ansible-playbook -b wsl.yaml --inventory "localhost," --vault-password-file .vault-password

bootstrap-new:
	ansible-playbook -b bootstrap.yaml --tags "bootstrap-new" --vault-password-file .vault-password

bootstrap-all:
	ansible-playbook -b bootstrap.yaml --tags "bootstrap-all" --vault-password-file .vault-password

full-bootstrap-all:
	ansible-playbook -b bootstrap.yaml --tags "bootstrap-all" --vault-password-file .vault-password
	ansible-playbook -b linux.yaml --tags "setup" --vault-password-file .vault-password

update-spacedock update-memory-alpha update-memory-beta update-argus-array:
	ansible-playbook -b linux.yaml --limit $(subst -,_,$(subst update-,,$@)) --tags "updates" --vault-password-file .vault-password

update-all:
	ansible-playbook -b linux.yaml --tags "updates" --vault-password-file .vault-password

install-requirements:
	ansible-galaxy role install -r requirements.yaml
	ansible-galaxy collection install -r requirements.yaml

force-install-requirements:
	ansible-galaxy role install -r requirements.yaml --force
	ansible-galaxy collection install -r requirements.yaml --force

decrypt-all:
	find . -name 'vault.yaml' -exec ansible-vault decrypt {} --vault-password .vault-password \;

encrypt-all:
	find . -name 'vault.yaml' -exec ansible-vault encrypt {} --vault-password .vault-password \;

install-git-hooks:
	@./install-git-hooks.sh

install-ansible:
	@./install-ansible.sh