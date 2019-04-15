#!/bin/bash

nohup mvn exec:java -X -f /usr/bin/Framework/luzzu-communications/pom.xml > /tmp/luzzu_output.log &

/bin/echo "Available commands: cancel failed pending stats status success"
/bin/bash
