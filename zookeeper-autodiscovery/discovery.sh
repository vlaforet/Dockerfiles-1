#! /bin/sh

IP_ADDR=$(ip addr show eth0  | awk '/inet/ { print $2; exit}' | cut -d'/' -f1)
export ZK_ID=-1
FOUND=false

echo "Container ip $IP_ADDR"
echo "Searching for peers in etcd, can take a moment"

I=0
while [ $ZK_ID = -1 ] || [ $ID = $MINUS_COUNT ]
do
  
  I=$(expr $I + 1)
  echo "Fetch #$I"

  sleep 2
  export ZK_SERVERS=$(curl -L http://$ETCD_ENDPOINT:$ETCD_PORT/v2/keys/$REGISTRATOR/$IMAGE_NAME-$PORT/ --silent | jq -r '.node.nodes | map(.value | split(":")[0]) | unique | join(",")')

  OIFS=$IFS
  IFS=','

  ID=1
  for server in $ZK_SERVERS
  do
  
    if [ $server = $IP_ADDR ]
    then
      ZK_ID=$ID
    fi

    ID=$(expr $ID + 1)
  done

  IFS=$OIFS

done

echo "Using myid $ZK_ID after $I fetch(s)"
echo "Peer(s) found: $ZK_SERVERS"
echo ""

./start.sh
