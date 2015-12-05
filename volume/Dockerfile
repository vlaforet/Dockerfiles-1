FROM alpine:3.2
MAINTAINER tech@extrasme.com

COPY user.sh /user.sh
RUN chmod +x /user.sh

VOLUME ["/data"]
ENTRYPOINT ["/user.sh"]
