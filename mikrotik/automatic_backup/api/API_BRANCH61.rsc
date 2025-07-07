# jul/05/2025 10:29:24 by RouterOS 6.45.1
# software id = 6YXY-3A4H
#
# model = CCR1016-12G
# serial number = 42D402E47D9C
/interface bridge
add name=lo
add name=sede_dataCenter
/interface ethernet
set [ find default-name=ether1 ] comment="FO Network" mac-address=\
    D4:CA:6D:AE:5B:3D speed=100Mbps
set [ find default-name=ether2 ] advertise=100M-full,1000M-full,2500M-full \
    comment="Wireless Network" mac-address=D4:CA:6D:AE:5B:3B speed=100Mbps
set [ find default-name=ether3 ] comment="HQ Router1" speed=100Mbps
set [ find default-name=ether4 ] comment=Firewall1 speed=100Mbps
set [ find default-name=ether5 ] speed=100Mbps
set [ find default-name=ether6 ] speed=100Mbps
set [ find default-name=ether7 ] speed=100Mbps
set [ find default-name=ether8 ] speed=100Mbps
set [ find default-name=ether9 ] speed=100Mbps
set [ find default-name=ether10 ] speed=100Mbps
set [ find default-name=ether11 ] speed=100Mbps
set [ find default-name=ether12 ] disabled=true speed=100Mbps
/interface vrrp
add disabled=true interface=ether1 name=VRRP-FO priority=150
add disabled=true interface=ether2 name=VRRP-Wireless priority=150 vrid=2
/interface wireless security-profiles
set [ find default=true ] supplicant-identity=MikroTik
/queue simple
add disabled=true max-limit=40960000/40960000 name=Control1 target=\
    10.20.9.12/30
add max-limit=100000000/100000000 name=queue1 target=ether2
/routing ospf area
add area-id=0.0.0.1 name=area1
/routing ospf instance
set [ find default=true ] distribute-default=if-installed-as-type-1 \
    redistribute-connected=as-type-1 redistribute-other-ospf=as-type-1 \
    router-id=1.1.1.61
/interface bridge port
add bridge=sede_dataCenter interface=ether1
add bridge=sede_dataCenter interface=ether4
/ip address
add address=10.20.10.61/24 interface=ether1 network=10.20.10.0
add address=10.20.11.61/24 interface=ether2 network=10.20.11.0
add address=10.20.9.14/30 interface=ether3 network=10.20.9.12
add address=10.20.10.60 disabled=true interface=VRRP-FO network=10.20.10.60
add address=10.20.11.60 disabled=true interface=VRRP-Wireless network=\
    10.20.11.60
add address=1.1.1.61 interface=lo network=1.1.1.61
add address=192.168.1.25/24 disabled=true interface=ether2 network=\
    192.168.1.0
add address=10.10.11.210/24 disabled=true interface=ether2 network=10.10.11.0
add address=10.20.30.1/24 disabled=true interface=ether1 network=10.20.30.0
/ip dns
set allow-remote-requests=true servers=8.8.8.8
/ip firewall address-list
add address=1.1.1.0/24 list=Router
add address=10.20.0.0/16 list=Router
/ip firewall filter
add action=drop chain=input protocol=ospf src-address=10.20.10.61
add action=drop chain=input protocol=ospf src-address=10.10.10.0/24
add action=drop chain=input protocol=ospf src-address=10.20.11.61
add action=drop chain=input dst-port=53 protocol=tcp src-address-list=!Router
/ip firewall mangle
add action=change-dscp chain=prerouting dst-address=1.1.1.0/24 new-dscp=46 \
    passthrough=true src-address=1.1.1.0/24
add action=change-dscp chain=prerouting dst-address=172.16.0.0/14 new-dscp=46 \
    passthrough=true src-address=172.16.0.0/14
/ip service
set telnet disabled=true
set ftp disabled=true
set www disabled=true
set ssh disabled=true
set api-ssl disabled=true
/ip ssh
set allow-none-crypto=true forwarding-enabled=remote
/lcd
set default-screen=informative-slideshow
/lcd pin
set pin-number=0218
/routing ospf area range
add area=area1 range=172.17.0.0/18
/routing ospf interface
add disabled=true interface=VRRP-FO network-type=broadcast passive=true
add disabled=true interface=VRRP-Wireless network-type=broadcast passive=true
add authentication=md5 authentication-key="\$2018\$" network-type=broadcast \
    priority=10
add authentication=md5 authentication-key="\$2018\$" interface=ether1 \
    network-type=nbma priority=10
add authentication=md5 authentication-key="\$2018\$" cost=20 interface=ether2 \
    network-type=nbma priority=10
/routing ospf nbma-neighbor
add address=10.20.10.1 poll-interval=30s
add address=10.20.10.2 poll-interval=30s
add address=10.20.10.3 poll-interval=30s
add address=10.20.10.4 poll-interval=30s
add address=10.20.10.5 poll-interval=30s
add address=10.20.10.6 poll-interval=30s
add address=10.20.10.7 poll-interval=30s
add address=10.20.10.8 poll-interval=30s
add address=10.20.10.9 poll-interval=30s
add address=10.20.10.10 poll-interval=30s
add address=10.20.10.11 poll-interval=30s
add address=10.20.10.12 poll-interval=30s
add address=10.20.10.13 poll-interval=30s
add address=10.20.10.14 poll-interval=30s
add address=10.20.10.15 poll-interval=30s
add address=10.20.10.16 poll-interval=30s
add address=10.20.10.17 poll-interval=30s
add address=10.20.10.18 poll-interval=30s
add address=10.20.10.19 poll-interval=30s
add address=10.20.10.20 poll-interval=30s
add address=10.20.10.21 poll-interval=30s
add address=10.20.10.30 poll-interval=30s
add address=10.20.10.23 poll-interval=30s
add address=10.20.10.24 poll-interval=30s
add address=10.20.10.25 poll-interval=30s
add address=10.20.10.26 poll-interval=30s
add address=10.20.10.27 poll-interval=30s
add address=10.20.10.28 poll-interval=30s
add address=10.20.10.29 poll-interval=30s
add address=10.20.10.62 poll-interval=30s
add address=10.20.11.1 poll-interval=30s
add address=10.20.11.2 poll-interval=30s
add address=10.20.11.3 poll-interval=30s
add address=10.20.11.4 poll-interval=30s
add address=10.20.11.5 poll-interval=30s
add address=10.20.11.6 poll-interval=30s
add address=10.20.11.7 poll-interval=30s
add address=10.20.11.8 poll-interval=30s
add address=10.20.11.9 poll-interval=30s
add address=10.20.11.10 poll-interval=30s
add address=10.20.11.11 poll-interval=30s
add address=10.20.11.12 poll-interval=30s
add address=10.20.11.13 poll-interval=30s
add address=10.20.11.14 poll-interval=30s
add address=10.20.11.15 poll-interval=30s
add address=10.20.11.16 poll-interval=30s
add address=10.20.11.17 poll-interval=30s
add address=10.20.11.18 poll-interval=30s
add address=10.20.11.19 poll-interval=30s
add address=10.20.11.20 poll-interval=30s
add address=10.20.11.21 poll-interval=30s
add address=10.20.11.22 poll-interval=30s
add address=10.20.11.23 poll-interval=30s
add address=10.20.11.24 poll-interval=30s
add address=10.20.11.25 poll-interval=30s
add address=10.20.11.26 poll-interval=30s
add address=10.20.11.27 poll-interval=30s
add address=10.20.11.28 poll-interval=30s
add address=10.20.11.29 poll-interval=30s
add address=10.20.11.62 poll-interval=30s
add address=10.20.10.203 poll-interval=30s
add address=10.20.10.22 poll-interval=30s
add address=10.20.11.30 poll-interval=30s
add address=10.20.10.68 poll-interval=30s
add address=10.20.11.68 poll-interval=30s
/routing ospf network
add area=backbone network=10.20.9.12/30
add area=area1 network=10.20.10.0/24
add area=area1 network=10.20.11.0/24
add area=backbone network=1.1.1.61/32
/routing ospf virtual-link
add authentication=md5 authentication-key="\$2018\$" neighbor-id=1.1.1.62 \
    transit-area=area1
/routing rip
set garbage-timer=0s metric-bgp=0 metric-connected=0 metric-default=0 \
    metric-ospf=0 metric-static=0 redistribute-connected=true \
    redistribute-ospf=true timeout-timer=0s update-timer=0s
/snmp
set enabled=true trap-interfaces=all trap-version=3
/system clock
set time-zone-name=Africa/Maputo
/system identity
set name="HQ1 Core Router"
/system logging
add topics=ospf,debug
/system ntp client
set enabled=true primary-ntp=10.20.10.254 secondary-ntp=196.9.24.88
/tool romon
set enabled=true secrets="\$2018\$"
