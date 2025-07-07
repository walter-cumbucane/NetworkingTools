# jul/05/2025 10:29:32 by RouterOS 6.43.4
# software id = YYFD-IYF5
#
# model = RouterBOARD 3011UiAS
# serial number = 8EED0845A158
/interface bridge
add name=lo
/interface ethernet
set [ find default-name=ether1 ] comment=FO
set [ find default-name=ether2 ] comment=WIRELESS disabled=true
set [ find default-name=ether3 ] comment=PCs
set [ find default-name=ether4 ] comment=LINK_MOVITEL
set [ find default-name=ether5 ] comment=LINK_BACKUP
set [ find default-name=ether6 ] comment=PRINTERS
set [ find default-name=ether7 ] comment="CAMERA AND OTHER DEVICES"
/interface list
add name=dicovery
/interface wireless security-profiles
set [ find default=true ] supplicant-identity=MikroTik
/ip ipsec proposal
set [ find default=true ] enc-algorithms=aes-256-cbc,aes-128-cbc
/ip pool
add name=dhcp_pool0 ranges=172.17.68.55-172.17.68.253
add name=dhcp_pool1 ranges=172.18.68.31-172.18.68.253
/ip dhcp-server
add address-pool=dhcp_pool1 disabled=false interface=ether3 lease-time=5m \
    name=dhcp1
/queue simple
add disabled=true max-limit=2000000/2000000 name=queue1 target=ether1
add disabled=true max-limit=30000000/30000000 name=queue2 target=ether5
/routing ospf area
set [ find default=true ] disabled=true
add area-id=0.0.0.1 name=area1
/routing ospf instance
set [ find default=true ] redistribute-connected=as-type-1 router-id=1.1.1.68
/ip neighbor discovery-settings
set discover-interface-list=all
/interface list member
add interface=ether1 list=dicovery
add interface=ether3 list=dicovery
add interface=ether2 list=dicovery
/ip address
add address=10.20.10.68/24 interface=ether4 network=10.20.10.0
add address=10.20.11.68/24 interface=ether5 network=10.20.11.0
add address=172.17.68.254/24 disabled=true interface=ether3 network=\
    172.17.68.0
add address=1.1.1.68 interface=lo network=1.1.1.68
add address=172.18.68.254/24 interface=ether3 network=172.18.68.0
/ip dhcp-server network
add address=172.18.68.0/24 dns-server=192.168.99.37 domain=adrmm.co.mz \
    gateway=172.18.68.254
/ip dns
set servers=8.8.8.8
/ip firewall filter
add action=drop chain=input protocol=ospf src-address-type=local
add action=drop chain=input protocol=ospf src-address-type=local
/ip firewall mangle
add action=change-dscp chain=prerouting dst-address=1.1.1.0/24 new-dscp=46 \
    passthrough=true src-address=1.1.1.0/24
add action=change-dscp chain=prerouting dst-address=172.16.0.0/14 new-dscp=46 \
    passthrough=true src-address=172.16.0.0/14
add action=change-dscp chain=prerouting dst-address=1.1.1.0/24 new-dscp=46 \
    passthrough=true src-address=1.1.1.0/24
add action=change-dscp chain=prerouting dst-address=172.16.0.0/14 new-dscp=46 \
    passthrough=true src-address=172.16.0.0/14
/ip ipsec peer
add address=1.1.1.72/32 local-address=1.1.1.68 secret="\$2018\$"
add address=1.1.1.71/32 local-address=1.1.1.68 secret="\$2018\$"
/ip ipsec policy
add dst-address=1.1.1.71/32 sa-dst-address=1.1.1.71 sa-src-address=1.1.1.68 \
    src-address=1.1.1.68/32 tunnel=true
add disabled=true dst-address=172.16.0.0/22 sa-dst-address=1.1.1.71 \
    sa-src-address=1.1.1.68 src-address=172.17.68.0/24 tunnel=true
add disabled=true dst-address=192.168.0.0/18 sa-dst-address=1.1.1.71 \
    sa-src-address=1.1.1.68 src-address=172.17.68.0/24 tunnel=true
add dst-address=192.168.0.0/17 sa-dst-address=1.1.1.71 sa-src-address=\
    1.1.1.68 src-address=172.18.68.0/24 tunnel=true
/ip service
set telnet disabled=true
set ftp disabled=true
set ssh disabled=true port=2222
set api-ssl disabled=true
/lcd
set default-screen=informative-slideshow
/lcd pin
set pin-number=0218
/routing filter
add action=discard chain=ospf-in disabled=true prefix=0.0.0.0/0
add action=discard chain=ospf-in prefix=10.20.10.0/24
add action=discard chain=ospf-in prefix=10.20.11.0/24
add action=discard chain=ospf-in disabled=true prefix=0.0.0.0/0
add action=discard chain=ospf-in prefix=10.20.10.0/24
add action=discard chain=ospf-in prefix=10.20.11.0/24
add action=discard chain=ospf-in disabled=true prefix=0.0.0.0/0
add action=discard chain=ospf-in prefix=10.20.10.0/24
add action=discard chain=ospf-in prefix=10.20.11.0/24
add action=discard chain=ospf-in disabled=true prefix=0.0.0.0/0
add action=discard chain=ospf-in prefix=10.20.10.0/24
add action=discard chain=ospf-in prefix=10.20.11.0/24
/routing ospf area range
add area=area1 range=172.17.1.0/24
/routing ospf interface
add authentication=md5 authentication-key="\$2018\$" network-type=broadcast \
    priority=0
add authentication=md5 authentication-key="\$2018\$" cost=20 interface=ether2 \
    network-type=nbma priority=0
add authentication=md5 authentication-key="\$2018\$" interface=ether1 \
    network-type=nbma priority=0
add authentication=md5 authentication-key="\$2018\$" interface=ether5 \
    network-type=nbma priority=0
add authentication=md5 authentication-key="\$2018\$" cost=15 interface=ether4 \
    network-type=nbma priority=0
/routing ospf nbma-neighbor
add address=10.20.10.61 poll-interval=30s
add address=10.20.11.61 poll-interval=30s
add address=10.20.11.62 poll-interval=30s
add address=10.20.10.62 poll-interval=30s
/routing ospf network
add area=area1 network=1.1.1.1/32
add area=area1 network=10.20.10.0/24
add area=area1 network=10.20.11.0/24
/snmp
set enabled=true trap-generators="" trap-version=3
/system clock
set time-zone-name=Africa/Maputo
/system identity
set name=EMILIA_DAUSSE
/system logging
add topics=debug,ospf
add topics=debug,ospf
add topics=debug,ospf
add topics=debug,ospf
/system ntp client
set enabled=true primary-ntp=10.20.10.254
/system routerboard settings
set silent-boot=false
/tool graphing interface
add allow-address=10.20.10.0/24
add allow-address=10.20.10.0/24
add allow-address=10.20.10.0/24
add allow-address=10.20.10.0/24
/tool graphing queue
add allow-address=10.20.10.0/24
add allow-address=10.20.10.0/24
add allow-address=10.20.10.0/24
add allow-address=10.20.10.0/24
/tool graphing resource
add allow-address=10.20.10.0/24
add allow-address=10.20.10.0/24
add allow-address=10.20.10.0/24
add allow-address=10.20.10.0/24
/tool romon
set enabled=true secrets="\$2018\$"
/tool traffic-monitor
add interface=ether1 name=tmon1 threshold=0
