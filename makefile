spacedock:
	ansible-playbook -b run.yaml --limit spacedock

memory-alpha:
	ansible-playbook -b run.yaml --limit memory_alpha --ask-become-pass --ask-vault-password

reqs:
	ansible-galaxy role install -r requirements.yaml
	ansible-galaxy collection install -r requirements.yaml

forcereqs:
	ansible-galaxy role install -r requirements.yaml --force
	ansible-galaxy collection install -r requirements.yaml --force
