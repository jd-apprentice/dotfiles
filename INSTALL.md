# Here we are going to explain in detail each of the steps that are running in the script

## Section 1:

### Identify our configuration and applications that we're going to save

What i'm going to save?

- kitty.conf - startup.conf - theme.conf - kitty-themes
- .alacritty.yml
- zsh
- apt/snap/deb applications

![image](https://cdn.discordapp.com/attachments/610338409671557121/1015386630674194513/unknown.png)

Saving this amount of information will save us time if we just had to copy this file into their directory.

## Section 1.5:

### Download the deb files

Are we going to download each of the .deb files manually? of course not.

- First we are going to identify each of the application we want to download
- We get their .deb location url with `curl`
- Then we download all at once with `wget`

## Solution:

- We can use the following script in our utils folder to get the .deb location url like this ->

```bash
#!/bin/bash

curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET <URL>
```

- Then we get this response

![image](https://cdn.discordapp.com/attachments/610338409671557121/1015480805843275888/unknown.png)

- Look at the response and what we want from here is the link in the key named `location` that is what we are going to be saving in `./txt/urls.txt`

- And in the end we are going to use the next script to download all the files at once.

```bash
#!/bin/bash

wget -P ~/Downloads -i ./txt/urls.txt

```

## Section 2:

### Install what you want

What was the objetive about this?

- Install everything we had before in our computer
- Do not have to find everything on how we installed each of the applications

I created the script called `install.sh` which will install the dependencies that I use for my daily routine.

## Solution:

```bash
#!/bin/bash

# variables
software=software-install.txt
snap=snap-install.txt
deb=~/Downloads

# apt applications
if [[ $1 = txt/$software ]]; then
  echo "🔴 Installing apt packages..."
  for f in $(cat $1);
  do
    sudo apt install $f -y;
  done;
# snap applications
elif [[ $1 = txt/$snap ]]; then
  echo "🔴 Installing snap packages..."
  for f in $(cat $1);
  do
    sudo snap install $f;
  done;
# deb applications
elif [[ $1 = $deb ]]; then
  echo "🔴 Installing deb packages..."
  for f in $1/*.deb;
  do
    sudo dpkg -i $f;
  done;
# wrong file name
else
  echo "$1 does not exist"
fi

# post-install
sudo apt install -f

# finished installation
echo "🏁 Done"
```

## Section 3:

How we are going to use our saved configuration files?

- Creating the base folders for our aliases, applications and more.
- Copying the files into their respective folders

I created the script called `directory.sh` for that task.

## Solution:

```bash
#!/bin/bash

echo "🔴 Moving to Home..."

cd $HOME

echo "🔴 Creating base folders..."

mkdir Documents/Trabajo
mkdir Documents/Proyectos

echo "🟢 Coming back to the folder repository..."

cd dotfiles/

echo "🟢 Copying configuration files..."

cp -r ./kitty ~/.config
cp ./zsh/.zshrc $HOME

echo "🏁 Finished"

clear
```

## Section 4:

Are we running everything at once?

- Yes! with the file called `run.sh` everything is going to work fine.
- This file runs every script in the repository

## Solution:

If you want to run everything automatically you have to give permissions to this individual script like this ->

```bash
#!/bin/bash

chmod +x ./run.sh;
```

Then once we run this script it will give permissions to the others and run them individually.

```bash
#!/bin/bash

# Permissions for the scripts
for file in $(cat ./txt/scripts.txt);
  do
    chmod +x ./scripts/$file;
  done;

# Running scripts
./download.sh
./install.sh txt/software-install.txt
./install.sh txt/snap-install.txt
./install.sh ~/Downloads
./post-install.sh
./directory.sh
./git-install.sh

# Post install
clear

# Setting zsh as default shell
chsh -s $(which zsh)
```

## Section 5:

There is more? Yes!

In the `post-install.sh` file we execute anything extra we need (like installed stuff that is not being handled by `install.sh`).

Here is the example of what I handle for myself

```bash
#!/bin/bash

######## oh-my-zsh ########

# install oh-my-zsh
echo "🎳 Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install fzf
echo "🎲 Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# install zsh-autosuggestions
echo "🎷 Cloning the zsh-autosuggestions repo..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

######## nvm ########

# install nvm
echo "🎯 Installing nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

echo "🔌 Getting node lts..."
nvm install --lts

######## vs-code ########

# doki theme
echo "🎮 Setting up theme for doki..."
sudo chown -R $(whoami) /usr/share/code/resources/app/out/vs/workbench

######## TMUX ########

# go $HOME
echo "🔴 Moving to Home..."
cd

# clone the config
echo "⌛️ Cloning the repository..."
git clone https://github.com/gpakosz/.tmux.git

# create ls
echo "🔗 Creating symbolic link..."
ln -s -f .tmux/.tmux.conf

# copy the config
echo "🛠️ Copying config..."
cp .tmux/.tmux.conf.local .

####### DOCKER ########

# Allow user to use a repository over HTTPS
echo "⌛️ Repository over HTTPS..."
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Adding up GPG Key & Setting up the repository
echo "🛠️ Adding up the GPG Key..."
sudo mkdir -p /etc/apt/keyrings

available_os=( 'Debian' 'CentOS' 'Fedora' 'Ubuntu' )
actual_system=$(cat /etc/issue)

echo "🛠️ Checking distribution..."
for element in "${available_os[@]}"; do
  if [[ "${actual_system}" == *"Debian"* ]]; then
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  elif [[ "${actual_system}" == *"Ubuntu"* ]]; then
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  fi
done

# Install Docker Engine, containerd, and Docker Compose
echo "🛠️ Installing everything..."
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

clear
```
