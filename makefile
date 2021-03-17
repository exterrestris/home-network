spacedock:
	ansible-playbook -b linux.yaml --limit spacedock --skip-tags "setup" --vault-password-file .vault-password

memory-alpha:
	ansible-playbook -b linux.yaml --limit memory_alpha --skip-tags "setup" --vault-password-file .vault-password

memory-beta:
	ansible-playbook -b linux.yaml --limit memory_beta --skip-tags "setup" --vault-password-file .vault-password

test-machines:
	ansible-playbook -b linux.yaml --limit test_machines --skip-tags "setup" --vault-password-file .vault-password

holosuite-1:
	ansible-playbook -b linux.yaml --limit holosuite_1 --skip-tags "setup" --vault-password-file .vault-password

holosuite-2:
	ansible-playbook -b linux.yaml --limit holosuite_2 --skip-tags "setup" --vault-password-file .vault-password

wsl:
	ansible-playbook -b wsl.yaml --inventory "localhost," --vault-password-file .vault-password

setup:
	ansible-playbook -b linux.yaml --tags "setup" --vault-password-file .vault-password

reqs:
	ansible-galaxy role install -r requirements.yaml
	ansible-galaxy collection install -r requirements.yaml

forcereqs:
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