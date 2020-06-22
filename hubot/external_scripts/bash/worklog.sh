#!/bin/bash

FILE_PATH=/home/hedge/mybot/hubot/database/worklog.txt
COMMAND=$@
touch $FILE_PATH 
echo $COMMAND >> $FILE_PATH
