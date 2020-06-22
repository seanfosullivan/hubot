#!/bin/bash

FILE_PATH=/home/hedge/mybot/hubot/database/ideas.txt
COMMAND=$@
touch $FILE_PATH 
echo $COMMAND >> $FILE_PATH
