#!bin/bash

echo "Generating ssh key.."

ssh-keygen -t ed25519 -C $1