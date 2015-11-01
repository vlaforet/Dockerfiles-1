#! /bin/bash

IP_ADDR=$(ip addr show eth0  | awk '/inet/ { print $2; exit}' | cut -d'/' -f1)

echo "Container ip $IP_ADDR"
echo "Searching for zookeepers in etcd, can take a moment"

export ZK_SERVERS=zk://$(curl -L http://$ETCD_ENDPOINT:$ETCD_PORT/v2/keys/$REGISTRATOR/$ZK_IMAGE_NAME-$ZK_PORT/ --silent | jq -r '.node.nodes | map(.value) | unique | join(",")')

./bin/start --master $ZK_SERVERS/mesos --zk $ZK_SERVERS/marathon $*
