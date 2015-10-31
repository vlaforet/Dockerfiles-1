docker build -t extrasme/mesos-slave-docker-autodisc .
docker run --rm  --privileged -v /sys:/sys -v /var/run/docker.sock:/var/run/docker.sock -e ETCD_ENDPOINT=10.1.77.1 -it extrasme/mesos-slave-docker-autodisc
