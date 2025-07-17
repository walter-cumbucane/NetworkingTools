# 2025-05-31 13:51:49 by RouterOS 7.19.1
# software id = 7X4Q-NMXY
#
# model = CCR1016-12G
# serial number = 42D402445EF4
/ip ipsec peer
add address=1.1.1.28/32 local-address=1.1.1.61 name=peer3
add address=1.1.1.10/32 local-address=1.1.1.61 name=peer1
add address=1.1.1.5/32 local-address=1.1.1.61 name=peer2
/ip pool
add name=dhcp_pool0 ranges=192.168.64.2-192.168.64.254
/ip dhcp-server
add address-pool=dhcp_pool0 interface=ether4 name=dhcp1
/port
set 0 name=serial0
set 1 name=serial1
/routing ospf instance
add disabled=no name=ospf
/routing ospf area
add disabled=no instance=ospf name=backbone
add area-id=1.1.1.1 disabled=no instance=ospf name=area1
/interface bridge port
add bridge=*F interface=ether12
add bridge=*F interface=ether3
/ip address
add address=10.20.10.61/24 interface=ether1 network=10.20.10.0
add address=10.20.11.61/24 interface=ether3 network=10.20.11.0
add address=1.1.1.61 interface=lo network=1.1.1.61
add address=10.20.9.2/30 interface=ether2 network=10.20.9.0
add address=192.168.64.1/24 interface=ether4 network=192.168.64.0
/ip dhcp-server network
add address=192.168.64.0/24 gateway=192.168.64.1
/ip ipsec identity
add peer=peer1
add peer=peer2
add peer=peer3
/ip ipsec policy
add dst-address=172.18.10.0/25 peer=peer1 src-address=192.168.64.0/24 tunnel=\
    yes
add dst-address=172.18.28.0/25 peer=peer2 src-address=192.168.64.0/24 tunnel=\
    yes
add dst-address=172.18.5.0/25 peer=peer3 src-address=192.168.64.0/24 tunnel=\
    yes
/ip service
set ftp disabled=yes
/routing ospf interface-template
add area=area1 cost=10 disabled=no interfaces=ether1
add area=area1 cost=50 disabled=no interfaces=ether3
add area=area1 cost=20 disabled=no interfaces=ether2
add area=backbone cost=10 disabled=no interfaces=ether4
add area=area1 cost=10 disabled=no interfaces=lo
/system identity
set name=HQ_CORE
/tool romon
set enabled=yes
