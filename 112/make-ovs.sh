# var
bridge=br-int
phy_interface=enp0s8
controller_ip=192.168.172.101

# add bridge
sudo ovs-vsctl add-br $bridge
sudo ovs-vsctl set-controller $bridge tcp:$controller_ip

# -- Connect to OVS bridge --
#Bridge mode
sudo ifconfig br-int 10.1.2.1 netmask 255.255.0.0 up

# create docker container
# sudo docker run -itd --name {name} -p {host port:container port} {image}
sudo docker run -itd --name c3 -p 8080:80 nginx
sudo docker run -itd --name c4 ubuntu:16.04

# connect bridge and container using ovs-docker
sudo ovs-docker add-port $bridge eth1 c3 --ipaddress=10.1.2.101/16 --gateway=10.1.2.1
sudo ovs-docker add-port $bridge eth1 c4 --ipaddress=10.1.2.102/16 --gateway=10.1.2.1

export pubintf=enp0s3 # physical interface
export privateintf=$bridge

# iptables rule
sudo iptables -t nat -A POSTROUTING -o $pubintf -j MASQUERADE
sudo iptables -A FORWARD -i $privateintf -j ACCEPT
sudo iptables -A FORWARD -i $privateintf -o $pubintf -m state --state RELATED,ESTABLISHED -j ACCEPT
