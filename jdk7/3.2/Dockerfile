FROM java:7-jdk
MAINTAINER https://github.com/muccg

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64
ENV GLASSFISH_HOME /usr/local/glassfish3
ENV PATH $PATH:$JAVA_HOME/bin:$GLASSFISH_HOME/bin

RUN apt-get update && \
    apt-get install -y curl unzip zip inotify-tools && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L -o /tmp/glassfish-3.2.zip http://download.oracle.com/glassfish/3.2/promoted/latest-glassfish.zip && \
    unzip /tmp/glassfish-3.2.zip -d /usr/local && \
    rm -f /tmp/glassfish-3.2.zip

EXPOSE 8080 4848 8181

WORKDIR /usr/local/glassfish3

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

RUN mkdir -p /data
VOLUME "/data"

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["glassfish"]
