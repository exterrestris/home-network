spacedock:
	ansible-playbook -b run.yaml --limit spacedock

memory-alpha:
	ansible-playbook -b run.yaml --limit memory_alpha --ask-become-pass

reqs:
	ansible-galaxy install -r requirements.yaml

forcereqs:
	ansible-galaxy install -r requirements.yaml --force
