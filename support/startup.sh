#!/bin/bash

cd /Luzzu/Framework/luzzu-communications/
nohup mvn exec:java -X > /tmp/framework_output.log &
