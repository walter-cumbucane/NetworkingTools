# 2025-03-12 10:46:24 by RouterOS 7.18.2
# software id = GZWT-77UD
#
# model = CCR1009-8G-1S
# serial number = 675005590B1C
/ip pool
add name=dhcp_pool0 ranges=172.18.28.1-172.18.28.125
/port
set 0 name=serial0
set 1 name=serial1
/routing ospf instance
add disabled=no name=ospf-instance-1
/routing ospf area
add area-id=1.1.1.1 disabled=no instance=ospf-instance-1 name=ospf-area-1
/ip address
add address=10.20.10.28/24 interface=ether1 network=10.20.10.0
add address=10.20.11.28/24 interface=ether2 network=10.20.11.0
add address=172.18.28.126/25 interface=ether3 network=172.18.28.0
add address=1.1.1.28 interface=lo network=1.1.1.28
/ip dhcp-server
add address-pool=dhcp_pool0 interface=ether3 name=dhcp1
/ip dhcp-server network
add address=172.18.28.0/25 gateway=172.18.28.126
/routing ospf interface-template
add area=ospf-area-1 cost=5 disabled=no interfaces=ether1
add area=ospf-area-1 cost=45 disabled=no interfaces=ether2
add area=ospf-area-1 cost=10 disabled=no interfaces=lo
add area=ospf-area-1 cost=10 disabled=no interfaces=ether3
/system identity
set name=hanhANE
/system note
set show-at-login=no
/tool romon
set enabled=yes
