#!/bin/bash

echo "Type in your email (the one used for your GitHub account): "
echo "Generating ssh key.."

ssh-keygen -t ed25519 -C $1