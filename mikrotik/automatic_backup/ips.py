from ipaddress import ip_network
from ping3 import ping
from ssh_client import backup

rede = ip_network("10.20.11.0/24")
hosts = list()

for ip in rede.hosts():
    if ping(str(ip), timeout=1):
        value = backup(str(ip))

print("Processo de Backup terminado")