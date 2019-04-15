#!/bin/bash

nohup mvn exec:java -X -f /Luzzu/Framework/luzzu-communications/pom.xml > /tmp/framework_output.log &

/bin/echo "Available commands: cancel failed pending stats status success"
/bin/bash
