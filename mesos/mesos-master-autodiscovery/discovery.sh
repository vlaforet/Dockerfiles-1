#! /bin/bash

IP_ADDR=$(ip addr show eth0  | awk '/inet/ { print $2; exit}' | cut -d'/' -f1)

echo "Container ip $IP_ADDR"
echo "Searching for zookeepers in etcd, can take a moment"

export ZK_SERVERS=$(curl -L http://$ETCD_ENDPOINT:$ETCD_PORT/v2/keys/$REGISTRATOR/$ZK_IMAGE_NAME-$ZK_PORT/ --silent | jq -r '.node.nodes | map(.value) | unique | join(",")')

./start.sh --ip=$IP_ADDR --advertise_ip=$IP_ADDR --quorum=$QUORUM --zk=zk://$ZK_SERVERS/mesos $*
