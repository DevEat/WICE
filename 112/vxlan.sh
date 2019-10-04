# var
bridge=br-int

# $1=interface $2=remote_ip
sudo ovs-vsctl add-port $bridge $1 -- set interface $1 type=vxlan options:remote_ip=$2