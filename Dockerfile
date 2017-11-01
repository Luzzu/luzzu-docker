FROM ubuntu
MAINTAINER Jeremy Debattista <jerdebattista@gmail.com>

RUN apt-get update && apt-get install -y wget openjdk-8-jdk maven git zip apache2

RUN mkdir /root/metadata

# Get the Luzzu Installation Script and install
RUN wget https://raw.githubusercontent.com/EIS-Bonn/Luzzu/gh-pages/setup/docker.sh
RUN chmod 777 docker.sh
RUN ./docker.sh

# Add functions to bash profile
RUN cd /root
RUN wget https://raw.githubusercontent.com/EIS-Bonn/Luzzu/gh-pages/setup/.bash_profile

# Get the startup script
RUN cd /usr/bin/Luzzu/
RUN wget https://raw.githubusercontent.com/EIS-Bonn/Luzzu/gh-pages/setup/startup.sh -O /usr/bin/Luzzu/startup.sh
RUN chmod 777 /usr/bin/Luzzu/startup.sh

# Expose ports
EXPOSE 8080
EXPOSE 80

#CMD ["/bin/echo", "Available commands: `pendingRequests` `successfulRequests` `failedRequests` `status {ID}` `statistics {ID}` `cancelRequest {ID}`"]
#ENTRYPOINT ["/bin/sh"]
ENTRYPOINT ["/usr/bin/Luzzu/startup.sh"]
