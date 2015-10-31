FROM extrasme/mesos
MAINTAINER tech@extrasme.com

RUN apt-get update && apt-get install -y apt-transport-https
RUN apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo "deb https://apt.dockerproject.org/repo debian-jessie main" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-engine && apt-get clean

COPY *.sh /mesos/
RUN chmod +x *.sh

ENTRYPOINT ["./start.sh"]
