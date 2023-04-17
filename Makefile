# Run command 'make' to install all the packages and configurations

run:
	chmod +x run.sh
	./scripts/run.sh

directory:
	chmod +x ./scripts/directory.sh
	./scripts/directory.sh

download:
	chmod +x ./scripts/download.sh
	./scripts/download.sh

git_install:
	chmod +x ./scripts/git-install.sh
	./scripts/git-install.sh

install:
	chmod +x ./scripts/install.sh
	./scripts/install.sh

post-install:
	chmod +x ./scripts/post-install.sh
	./scripts/post-install.sh

themes:
	chmod +x ./scripts/themes.sh
	./scripts/themes.sh