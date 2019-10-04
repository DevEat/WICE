# docker&openvswitch install
sudo apt-get update
sudo apt-get install docker-compose openvswitch-switch -y

# ovs-docker install
cd /usr/bin
wget https://raw.githubusercontent.com/openvswitch/ovs/master/utilities/ovs-docker
sudo chmod a+rwx /usr/bin/ovs-docker