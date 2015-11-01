docker build -t extrasme/marathon-autodisc .
docker run -p 8080:8080 -e ETCD_ENDPOINT=10.1.77.1 -it extrasme/marathon-autodisc
