FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y python-software-properties
RUN add-apt-repository ppa:webupd8team/java -y

RUN apt-get update
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

RUN apt-get install -y oracle-java7-installer wget

RUN wget -q -O /opt/zookeeper-3.4.5.tar.gz http://apache.mirrors.pair.com/zookeeper/zookeeper-3.4.5/zookeeper-3.4.5.tar.gz 
RUN tar -xzf /opt/zookeeper-3.4.5.tar.gz -C /opt 
RUN cp /opt/zookeeper-3.4.5/conf/zoo_sample.cfg /opt/zookeeper-3.4.5/conf/zoo.cfg


EXPOSE 2181 2888 3888

ENTRYPOINT ["/opt/zookeeper-3.4.5/bin/zkServer.sh"]
CMD ["start-foreground"]
