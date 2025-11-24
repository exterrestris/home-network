wsl:
	ansible-playbook -b wsl.yaml --inventory "localhost," --ask-become-pass

install-requirements:
	ansible-galaxy role install -r requirements.yaml
	ansible-galaxy collection install -r requirements.yaml

install-git-hooks:
	@./install-git-hooks.sh

install-ansible:
	@./install-ansible.sh
