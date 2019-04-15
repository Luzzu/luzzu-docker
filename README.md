# Luzzu Docker Container
This repository contains the dockerfile to run the Luzzu Framework from a docker container. The container is set up with a number of quality metrics from the Intrinsic, Representation, and Contextual dimension.

## Setup
docker pull luzzu/luzzu-framework

## Usage
This container will have the Luzzu Framework and Web application installed, running on port 8080. In order to run Luzzu from the docker, you need to run the following command: 

`docker run -it --name luzzu-docker -p 8080:8080 -d luzzu`. 

If you are using port 8080, then change the host port to a desired port number.

We recommend that each Luzzu instance has a volume attached for the quality metadata folder and temporary files. The following are their paths in the container:

`/Luzzu/Framework/luzzu-communications/quality-metadata`
`/tmp/`

A volume can be added by adding the -v option in the run command. Eg.:

`docker run -it --name luzzu-docker -p 8080:8080 -v /Users/jeremy/luzzu/quality-metadata:/Luzzu/Framework/luzzu-communications/quality-metadata /Users/jeremy/Docker/Luzzu_Docker_Image/tmp:/tmp/ -d luzzu`

For additional quality metrics, you can also attach the /Luzzu/Framework/luzzu-communications/externals folder as another volume. If new metrics are added, the docker container has to be restarted.
