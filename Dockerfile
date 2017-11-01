FROM ubuntu
MAINTAINER Jeremy Debattista <jerdebattista@gmail.com>

RUN apt-get update && apt-get install -y wget openjdk-8-jdk maven git zip apache2

RUN mkdir /root/metadata

# Get the Luzzu Installation Script and install
RUN wget https://raw.githubusercontent.com/Luzzu/luzzu-docker/master/support/docker.sh
RUN chmod 777 docker.sh
RUN ./docker.sh

# Get Luzzu Tools
RUN mkdir /opt/luzzu-tools
RUN wget https://raw.githubusercontent.com/Luzzu/luzzu-docker/master/tools/cancel -O /opt/luzzu-tools/cancel
RUN wget https://raw.githubusercontent.com/Luzzu/luzzu-docker/master/tools/failed -O /opt/luzzu-tools/failed
RUN wget https://raw.githubusercontent.com/Luzzu/luzzu-docker/master/tools/pending -O /opt/luzzu-tools/pending
RUN wget https://raw.githubusercontent.com/Luzzu/luzzu-docker/master/tools/stats -O /opt/luzzu-tools/stats
RUN wget https://raw.githubusercontent.com/Luzzu/luzzu-docker/master/tools/status -O /opt/luzzu-tools/status
RUN wget https://raw.githubusercontent.com/Luzzu/luzzu-docker/master/tools/success -O /opt/luzzu-tools/success
RUN chmod +x /opt/luzzu-tools/*

ENV PATH /opt/luzzu-tools:$PATH

# Get the startup script
RUN cd /usr/bin/Luzzu/
RUN wget https://raw.githubusercontent.com/Luzzu/luzzu-docker/master/support/startup.sh -O /usr/bin/Luzzu/startup.sh
RUN chmod 777 /usr/bin/Luzzu/startup.sh

# Expose ports
EXPOSE 8080
EXPOSE 80

ENTRYPOINT ["/usr/bin/Luzzu/startup.sh"]
CMD ["/bin/echo", "Available commands: `cancel` `failed` `pending` `stats` `status` `success`"]
