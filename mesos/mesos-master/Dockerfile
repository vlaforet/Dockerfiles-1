FROM extrasme/mesos
MAINTAINER tech@extrasme.com

EXPOSE 5051

COPY *.sh /mesos/
RUN chmod +x *.sh

ENTRYPOINT ["./start.sh"]
