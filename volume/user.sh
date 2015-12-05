#! /bin/sh

if [ $# -eq 0 ]
then
  echo "Starting with normal user"
else
  echo "Starting with user $1"
  
  adduser -S $1
  chown -R $1 /data
   
fi
