# Run command 'make' to install all the packages and configurations

run:
	chmod +x run.sh
	./scripts/run.sh

# Create the necessary directories and copy the files
directory:
	chmod +x ./scripts/directory.sh
	./scripts/directory.sh

# Download the necessary packages
download:
	chmod +x ./scripts/download.sh
	./scripts/download.sh

# Configuration for git
git_install:
	chmod +x ./scripts/git-install.sh
	./scripts/git-install.sh

# Install everything
install:
	chmod +x ./scripts/install.sh
	./scripts/install.sh

# Extra configuration done after installation
post-install:
	chmod +x ./scripts/post-install.sh
	./scripts/post-install.sh

# Copy the themes to the correct directory
themes:
	chmod +x ./scripts/themes.sh
	./scripts/themes.sh