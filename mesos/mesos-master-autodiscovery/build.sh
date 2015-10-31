docker build -t extrasme/mesos-master-autodisc .
docker run --rm -e ETCD_ENDPOINT=10.1.77.1 -it extrasme/mesos-master-autodisc
