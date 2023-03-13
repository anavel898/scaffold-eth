#!/bin/bash

yarn chain &
sleep 10
echo "Hardhat node started"

yarn deploy &
echo "Contract deployed"

yarn start &
"Frontend started"

while true
do
        git fetch
        UPSTREAM=${1:-'@{u}'}
        LOCAL=$(git rev-parse @)
        REMOTE=$(git rev-parse "$UPSTREAM")
        BASE=$(git merge-base @ "$UPSTREAM")

        if [ $LOCAL = $REMOTE ];then
                echo "Local repo up-to-date with remote"
        elif [ $LOCAL = $BASE ]; then
                echo "Local is behind remote. Need to pull"
                git pull
                yarn deploy
                #yarn start &  #I'll add it after I figure out how the frontend refreshes
        fi
        sleep 60
done
