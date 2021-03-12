spacedock:
	ansible-playbook -b run.yaml --limit spacedock --skip-tags "setup" --vault-password-file .vault-password

memory-alpha:
	ansible-playbook -b run.yaml --limit memory_alpha --skip-tags "setup" --vault-password-file .vault-password

memory-beta:
	ansible-playbook -b run.yaml --limit memory_beta --skip-tags "setup" --vault-password-file .vault-password

test-machines:
	ansible-playbook -b run.yaml --limit test_machines --skip-tags "setup" --vault-password-file .vault-password

holosuite-1:
	ansible-playbook -b run.yaml --limit holosuite_1 --skip-tags "setup" --vault-password-file .vault-password

holosuite-2:
	ansible-playbook -b run.yaml --limit holosuite_2 --skip-tags "setup" --vault-password-file .vault-password

setup:
	ansible-playbook -b run.yaml --tags "setup" --vault-password-file .vault-password

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
	@echo "ansible vault pre-commit hook installed"