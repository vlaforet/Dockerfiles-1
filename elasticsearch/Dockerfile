FROM extrasme/openjre
MAINTAINER tech@extrasme.com

ENV ELASTIC_PNAME elasticsearch-2.0.0
RUN cd / && \
    wget https://download.elasticsearch.org/elasticsearch/elasticsearch/$ELASTIC_PNAME.tar.gz && \
    tar xvzf $ELASTIC_PNAME.tar.gz && \
    rm -f $ELASTIC_PNAME.tar.gz && \
    mv /$ELASTIC_PNAME /elasticsearch

RUN adduser -S elasticsearch

USER elasticsearch

EXPOSE 9200 9300
WORKDIR /elasticsearch

COPY elasticsearch.yml /elasticsearch/config/elasticsearch.yml
COPY *.sh /elasticsearch/
RUN chmod +x /elasticsearch/*.sh 

VOLUME ["/data"]
CMD ["/elasticsearch/start.sh"]
