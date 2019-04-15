#!/bin/bash

# cd /Luzzu/Framework/luzzu-communications/
# mvn exec:java > /tmp/framework_output.log 

nohup mvn exec:java -X -f /usr/bin/Framework/luzzu-communications/pom.xml > /tmp/luzzu_output.log &
