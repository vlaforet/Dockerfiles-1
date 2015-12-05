#! /bin/bash

if [ "$1" = "master" ]; then
  echo "node.data=false" >> /elasticsearch/config/elasticsearch.yml
fi

if [ -z "$2" ]; then
  CMD_ARGS="-Des.cluster.name=$2"
fi

/elasticsearch/bin/elasticsearch $CMD_ARGS

