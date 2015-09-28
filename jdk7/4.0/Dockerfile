FROM glassfish:4.0-jdk7
MAINTAINER https://github.com/muccg

EXPOSE 8080 8081 4848

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

RUN mkdir -p /data
VOLUME "/data"

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["glassfish"]
