run: dependencies
	chmod +x run.sh
	./run.sh

update:
	sudo apt-get update -y && sudo apt-get upgrade -y

dependencies: update
	sudo apt-get install git curl wget zsh tmux python3-pip -y

git:
	chmod +x git.sh
	scripts/git-install.sh

ansible:
	chmod +x ansible.sh
	scripts/ansible-install.sh

terraform:
	chmod +x terraform.sh
	scripts/terraform-install.sh

@echo "Usage: make [dependencies|run|git|ansible|terraform]"

.PHONY: update