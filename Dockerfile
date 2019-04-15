FROM openjdk:8-jdk-alpine
MAINTAINER Jeremy Debattista <jerdebattista@gmail.com>

RUN apk add --update bash && rm -rf /var/cache/apk/*
RUN apk update && apk add maven git zip httpie

# Get the Luzzu Installation Script and install
RUN mkdir /Luzzu

RUN wget https://raw.githubusercontent.com/Luzzu/luzzu-docker/master/support/docker.sh
RUN chmod +x docker.sh
RUN ./docker.sh

# Get the startup script
RUN cd /Luzzu/Framework/
RUN wget https://raw.githubusercontent.com/Luzzu/luzzu-docker/master/support/startup.sh -O /Luzzu/Framework/startup.sh
RUN chmod +x /Luzzu/Framework/startup.sh
RUN /Luzzu/Framework/startup.sh


# Create directories and folders that needs to be attached to a local volume
RUN touch /tmp/framework_output.log
RUN mkdir /Luzzu/Framework/luzzu-communications/quality-metadata
RUN mkdir /tmp/luzzu/

# Expose port 8080 for framework and webapp
EXPOSE 8080

ENTRYPOINT ["/Luzzu/Framework/startup.sh"]
