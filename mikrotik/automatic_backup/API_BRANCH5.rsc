# 2025-03-12 10:46:47 by RouterOS 7.18.2
# software id = S27T-C3QM
#
# model = CCR1009-8G-1S
# serial number = 67500541B864
/interface bridge
add name=matola
/ip pool
add name=dhcp_pool0 ranges=172.18.5.1-172.18.5.125
/ip dhcp-server
add address-pool=dhcp_pool0 interface=ether3 name=dhcp1
/port
set 0 name=serial0
set 1 name=serial1
/routing ospf instance
add disabled=no name=ospf-instance-1
/routing ospf area
add area-id=1.1.1.1 disabled=no instance=ospf-instance-1 name=ospf-area-1
/interface bridge port
add bridge=matola interface=ether8
add bridge=matola interface=ether7
add bridge=matola interface=ether6
add bridge=matola interface=ether2
add bridge=matola interface=ether5
/ip address
add address=10.20.10.5/24 interface=ether1 network=10.20.10.0
add address=10.20.11.5/24 interface=ether2 network=10.20.11.0
add address=172.18.5.126/25 interface=ether3 network=172.18.5.0
add address=1.1.1.5 interface=lo network=1.1.1.5
/ip dhcp-server network
add address=172.18.5.0/25 gateway=172.18.5.126
/ip service
set ftp disabled=yes
/routing ospf interface-template
add area=ospf-area-1 cost=10 disabled=no interfaces=ether1
add area=ospf-area-1 cost=50 disabled=no interfaces=ether2
add area=ospf-area-1 cost=10 disabled=no interfaces=lo
/system identity
set name=MATOLA
/system note
set show-at-login=no
/tool romon
set enabled=yes
