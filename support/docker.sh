#!/bin/bash
PATH_INSTALLATION='/usr/bin' # the path where Luzzu and the Quality Metric repository should be installed

# Pull and build RDFHDT
git clone https://github.com/rdfhdt/hdt-java.git
cd hdt-java
mvn clean install -Dmaven.test.skip=true


# Pull Luzzu and Quality Metrics from repository
echo "Installing Luzzu in $PATH_INSTALLATION"
cd $PATH_INSTALLATION
echo "Pullingand Installing Luzzu"
git clone https://github.com/Luzzu/Framework.git
cd Framework
mvn clean install -Dmaven.test.skip=true


echo "Setting up Metrics"
cd $PATH_INSTALLATION/Framework/luzzu-communications/externals/metrics/
wget http://s001.adaptcentre.ie/FrameworkMetrics/LDMetrics/intrinsic.zip
unzip intrinsic.zip
rm intrinsic.zip
wget http://s001.adaptcentre.ie/FrameworkMetrics/LDMetrics/representational.zip
unzip representational.zip
rm representational.zip
wget http://s001.adaptcentre.ie/FrameworkMetrics/LDMetrics/contextual.zip
unzip contextual.zip
rm contextual.zip

cd $PATH_INSTALLATION/Framework/luzzu-communications/externals/vocabs/
wget http://s001.adaptcentre.ie/FrameworkMetrics/Vocabs/dqm.zip
unzip dqm.zip
rm dqm.zip
