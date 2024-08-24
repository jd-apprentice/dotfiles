#!/bin/bash

BASE_NAME="node"
DOMAIN=".local"
START_NUM=0
END_NUM=3
USER=$(whoami)
REMOTE_PATH="$HOME/backup"
LOCAL_PATH="$HOME/.config"

for ((i=START_NUM; i<=END_NUM; i++)); do
    HOST="${BASE_NAME}$(printf "%02d" $i)${DOMAIN}"
    REMOTE_DEST="${USER}@${HOST}:${REMOTE_PATH}"
    
    echo "Doing backup for $HOST..."
    rsync -a --progress --delete --quiet -e ssh "$LOCAL_PATH" "$REMOTE_DEST"
    
    if [ ! $? -eq 0 ]; then
        echo "Err while doing backup for $HOST. Skipping..."
        exit 1
    fi

    echo "Completed backup for $HOST"
done
