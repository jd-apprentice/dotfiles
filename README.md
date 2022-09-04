# dotfiles

- 🐧 This is my personal configuration repository
- 🥺 Idk what i'm doing so be patient

## welcome

![image](https://data.whicdn.com/images/245075010/original.gif)

# What we are trying to learn about here?

- The objetive of this section is about learning about saving and re-use the configuration if we change our environment or we want to try a new distribution etc.

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

If you want to run everything autmatically you have to give permissions to this individual script like this ->

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
    chmod +x $file;
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
