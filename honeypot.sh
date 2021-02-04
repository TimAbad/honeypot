#!/bin/bash
DIR="/home/tabad/honeypot"

while :
do
  for var in "$@"
  do
   PORT=$var
   if ! [ -f $PORT.log ]; then
        touch $PORT.log
   fi
   echo "" >>$DIR/$PORT.log;
   sudo nc -lvnp $PORT < $DIR/banner.txt 1>>$DIR/$PORT.log 2>>$DIR/$PORT.log;

   echo $(date) >> $DIR/$PORT.log; #log date/time of connection
   sleep 2 # to allow the connection to close properly
  done
done
