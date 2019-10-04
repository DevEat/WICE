#!/bin/bash

# required build tools
sudo apt-get update
sudo apt-get install git zip curl unzip python python3 bzip2 openjdk-8-jdk curl -y

# download onos
wget https://repo1.maven.org/maven2/org/onosproject/onos-releases/1.13.3/onos-1.13.3.tar.gz
sudo tar zxvf onos-1.13.3.tar.gz
sudo mv onos-1.13.3 onos

# make starting scripts for ONOS
echo sudo ~/onos/bin/onos-service start > ~/onos/onos-start.sh
sudo chmod +x ~/onos/onos-start.sh