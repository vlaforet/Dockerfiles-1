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

cat conf/zoo.cfg
echo $JMXDISABLE

echo "Building myid as server dsq $ZK_ID"
echo $ZK_ID > /data/myid
echo "Starting zookeeper server $(cat /data/myid)"
export JMXDISABLE=true

./bin/zkServer.sh start-foreground
