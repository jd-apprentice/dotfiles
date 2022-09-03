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
- apt/snap applications

![image](https://cdn.discordapp.com/attachments/610338409671557121/1015386630674194513/unknown.png)

Saving this amount of information will save us time if we just had to copy this file into their directory.

## Section 2:

### Install what you want

What was the objetive about this?

- Install everything we had before in our computer
- Do not have to find everything on how we installed each of the applications

I created the script called `install.sh` which will install the dependencies that I use for my daily routine.

## Solution:

```bash
#!/bin/bash

software=software-install.txt
snap=snap-install.txt

if [[ $1 = txt/$software ]]; then
  echo "🔴 Installing apt packages..."
  for f in $(cat $1);
  do
    sudo apt install $f -y;
  done;
  echo "🏁 Done"
elif [[ $1 = txt/$snap ]]; then
  echo "🔴 Installing apt packages..."
  for f in $(cat $1);
  do
    sudo snap install $f;
  done;
  echo "🏁 Done"
else
  echo "$1 does not exist"
fi
```

## Section 3:

How we are going to use our saved configuration files?

- Creating the base folders for our aliases, applications and more.
- Copying the files into their respective folders

I created the script called `directory.sh` for that task.

## Solution:

```bash
#!/bin/bash

echo "🔴 Creating base folders..."

mkdir Documents/Trabajo
mkdir Documents/Proyectos

echo "🟢 Copying configuration files..."

cp -r ./kitty ~/.config
cp ./zsh/.zshrc $HOME

echo "🏁 Finished"
```
