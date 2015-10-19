FROM extrasme/zookeeper
MAINTAINER tech@extrasme.com

RUN apt-get update && apt-get install -y jq && apt-get clean

ADD discovery.sh /zookeeper/
RUN chmod +x /zookeeper/*.sh

ENV ETCD_PORT=4001 REGISTRATOR=registrator IMAGE_NAME=zookeeper-autodisc PORT=2888

CMD ["/zookeeper/discovery.sh"]
