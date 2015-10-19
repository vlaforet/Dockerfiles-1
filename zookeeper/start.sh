#! /bin/sh

cp conf/zoo.cfg.template conf/zoo.cfg

OIFS=$IFS
IFS=','

ID=1
for server in $ZK_SERVERS
do
  echo "server.$ID=$server:2888:3888" >> conf/zoo.cfg
  ID=$(expr $ID + 1)
done

IFS=$OIFS

echo "Building myid as server $ZK_ID"
echo $ZK_ID > /data/myid
echo "Starting zookeeper server $(cat /data/myid) with $(expr $ID - 1) peer(s)"
echo ""

export JMXDISABLE=true

/bin/bash ./bin/zkServer.sh start-foreground
