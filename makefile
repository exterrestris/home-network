spacedock:
	ansible-playbook -b run.yaml --limit spacedock --ask-become-pass --vault-password-file .vault-password

memory-alpha:
	ansible-playbook -b run.yaml --limit memory_alpha --ask-become-pass --vault-password-file .vault-password

memory-beta:
	ansible-playbook -b run.yaml --limit memory_beta --ask-become-pass --vault-password-file .vault-password

setup:
	ansible-playbook -b run.yaml --tags "setup" --ask-become-pass --vault-password-file .vault-password

reqs:
	ansible-galaxy role install -r requirements.yaml
	ansible-galaxy collection install -r requirements.yaml

forcereqs:
	ansible-galaxy role install -r requirements.yaml --force
	ansible-galaxy collection install -r requirements.yaml --force

install-git-hooks:
	@./install-git-hooks.sh
	@echo "ansible vault pre-commit hook installed"