# 2025-05-31 13:46:45 by RouterOS 7.19.1
# software id = 1PZI-L5PH
#
# model = CCR1036-8G-2S+
# serial number = 91A508A06572
/ip ipsec peer
add address=1.1.1.61/32 local-address=1.1.1.10 name=peer1
/ip pool
add name=dhcp_pool0 ranges=172.18.10.1-172.18.10.125
/ip dhcp-server
add address-pool=dhcp_pool0 interface=ether3 name=dhcp1
/port
set 0 name=serial0
set 1 name=serial1
/routing ospf instance
add disabled=no name=ospf-instance-1
/routing ospf area
add area-id=1.1.1.1 disabled=no instance=ospf-instance-1 name=ospf-area-1
/ip address
add address=10.20.11.10/24 interface=ether2 network=10.20.11.0
add address=172.18.10.126/25 interface=ether3 network=172.18.10.0
add address=1.1.1.10 interface=lo network=1.1.1.10
/ip dhcp-server network
add address=172.18.10.0/25 gateway=172.18.10.126
/ip ipsec identity
add peer=peer1
/ip ipsec policy
add dst-address=192.168.64.0/24 peer=peer1 src-address=172.18.10.0/25 tunnel=\
    yes
/ip service
set ftp disabled=yes
/routing ospf interface-template
add area=ospf-area-1 cost=50 disabled=no interfaces=ether2
add area=ospf-area-1 cost=10 disabled=no interfaces=ether3
add area=ospf-area-1 cost=10 disabled=no interfaces=lo
/system identity
set name=c700
/tool romon
set enabled=yes
