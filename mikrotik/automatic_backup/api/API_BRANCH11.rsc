# jul/05/2025 10:28:06 by RouterOS 6.43.4
# software id = HETV-H4RB
#
# model = RouterBOARD 3011UiAS
# serial number = 8EED08B10244
/interface bridge
add name=lo
/interface ethernet
set [ find default-name=ether1 ] comment=FO
set [ find default-name=ether2 ] comment=WIRELESS
set [ find default-name=ether3 ] comment=PCs
set [ find default-name=ether6 ] comment=PRINTERS
set [ find default-name=ether7 ] comment="CAMERA AND OTHER DEVICES"
/interface list
add name=dicovery
/interface wireless security-profiles
set [ find default=true ] supplicant-identity=MikroTik
/ip ipsec proposal
set [ find default=true ] enc-algorithms=aes-256-cbc,aes-128-cbc
/ip pool
add name=dhcp_pool0 ranges=172.18.11.31-172.18.11.125
/ip dhcp-server
add address-pool=dhcp_pool0 disabled=false interface=ether3 name=dhcp1
/queue simple
add disabled=true max-limit=2000000/2000000 name=queue1 target=ether1
add disabled=true max-limit=2000000/2000000 name=queue2 target=ether2
/routing ospf area
set [ find default=true ] disabled=true
add area-id=0.0.0.1 name=area1
/routing ospf instance
set [ find default=true ] redistribute-connected=as-type-1
/ip neighbor discovery-settings
set discover-interface-list=all
/interface list member
add interface=ether1 list=dicovery
add interface=ether3 list=dicovery
add interface=ether2 list=dicovery
/ip address
add address=10.20.10.11/24 interface=ether1 network=10.20.10.0
add address=10.20.11.11/24 interface=ether2 network=10.20.11.0
add address=172.17.11.126/25 disabled=true interface=ether3 network=\
    172.17.11.0
add address=1.1.1.11 interface=lo network=1.1.1.11
add address=172.17.11.190/26 interface=ether6 network=172.17.11.128
add address=172.17.11.254/26 interface=ether7 network=172.17.11.192
add address=10.10.11.210/24 disabled=true interface=ether2 network=10.10.11.0
add address=172.18.11.126/25 interface=ether3 network=172.18.11.0
/ip dhcp-server lease
add address=172.17.11.41 mac-address=74:E6:0F:85:30:6C server=dhcp1
/ip dhcp-server network
add address=172.18.11.0/25 dns-server=192.168.99.37 domain=adrrm.co.mz \
    gateway=172.18.11.126
/ip dns
set servers=1.1.1.81
/ip firewall filter
add action=drop chain=input disabled=true protocol=ospf src-address-type=\
    local
/ip firewall mangle
add action=change-dscp chain=prerouting dst-address=1.1.1.0/24 new-dscp=46 \
    passthrough=true src-address=1.1.1.0/24
add action=change-dscp chain=prerouting dst-address=172.16.0.0/14 new-dscp=46 \
    passthrough=true src-address=172.16.0.0/14
/ip ipsec peer
add address=1.1.1.72/32 local-address=1.1.1.11 secret="\$2018\$"
add address=1.1.1.71/32 local-address=1.1.1.11 secret="\$2018\$"
/ip ipsec policy
add dst-address=1.1.1.71/32 sa-dst-address=1.1.1.71 sa-src-address=1.1.1.11 \
    src-address=1.1.1.11/32 tunnel=true
add disabled=true dst-address=1.1.1.72/32 sa-dst-address=1.1.1.72 \
    sa-src-address=1.1.1.11 src-address=1.1.1.11/32 tunnel=true
add disabled=true dst-address=172.16.0.0/22 sa-dst-address=1.1.1.71 \
    sa-src-address=1.1.1.11 src-address=172.17.11.0/24 tunnel=true
add dst-address=192.168.0.0/17 sa-dst-address=1.1.1.71 sa-src-address=\
    1.1.1.11 src-address=172.18.11.0/25 tunnel=true
add disabled=true dst-address=192.168.0.0/18 sa-dst-address=1.1.1.71 \
    sa-src-address=1.1.1.11 src-address=172.17.11.0/25 tunnel=true
/ip proxy access
add action=deny comment="block telnet & spam e-mail relaying" dst-port=23-25
add action=deny comment=\
    "allow CONNECT only to SSL ports 443 [https] and 563 [snews]" dst-port=\
    !443,563 method=CONNECT
/ip service
set telnet disabled=true
set ftp disabled=true
set www disabled=true
set ssh disabled=true port=2222
set api-ssl disabled=true
/lcd
set default-screen=informative-slideshow time-interval=hour
/lcd pin
set pin-number=0218
/routing filter
add action=discard chain=ospf-in disabled=true prefix=0.0.0.0/0
add action=discard chain=ospf-in prefix=10.20.10.0/24
add action=discard chain=ospf-in prefix=10.20.11.0/24
/routing ospf area range
add area=area1 range=172.17.11.0/24
/routing ospf interface
add authentication=md5 authentication-key="\$2018\$" network-type=broadcast \
    priority=0
add authentication=md5 authentication-key="\$2018\$" cost=20 interface=ether2 \
    network-type=nbma priority=0
add authentication=md5 authentication-key="\$2018\$" interface=ether1 \
    network-type=nbma priority=0
/routing ospf nbma-neighbor
add address=10.20.10.61 poll-interval=30s
add address=10.20.11.61 poll-interval=30s
add address=10.20.11.62 poll-interval=30s
add address=10.20.10.62 poll-interval=30s
/routing ospf network
add area=area1 network=1.1.1.11/32
add area=area1 network=10.20.10.0/24
add area=area1 network=10.20.11.0/24
/snmp
set enabled=true
/system clock
set time-zone-name=Africa/Maputo
/system identity
set name="Branch 11"
/system logging
add topics=debug,ospf
/system ntp client
set enabled=true primary-ntp=10.20.10.254
/system routerboard settings
set silent-boot=false
/tool romon
set enabled=true secrets="\$2018\$"
