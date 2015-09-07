#! /bin/sh

cp $ZOOKEEPER_DIR/conf/zoo.cfg.template $ZOOKEEPER_DIR/conf/zoo.cfg
OIFS=$IFS
IFS=','
ID=1
for server in $ZK_SERVERS
do
  echo "server.$ID=$server:2888:3888" >> $ZOOKEEPER_DIR/conf/zoo.cfg
  ID=$(expr $ID + 1)
done
IFS=$OIFS
cat $ZOOKEEPER_DIR/conf/zoo.cfg


echo "Building myid as server $ZK_ID"
echo $ZK_ID > /data/myid
echo "Starting zookeeper server $(cat /data/myid)"
export JMXDISABLE=true

#$ZOOKEEPER_DIR/bin/zkServer.sh start-foreground
