from mikrotik.automatic_backup.api.api_client import ApiRos
from mikrotik.automatic_backup.api.conect_to_device import open_connection
from ipaddress import ip_network
from ping3 import ping
from mikrotik.automatic_backup.ftp_client import connect_to_ftp


def main():

    rede = ip_network("10.20.11.0/24")
    for ip in rede.hosts():
        if ping(str(ip), timeout=1):
            backup(ip)


def backup(router):
    sock = open_connection(router, 8728, False)

    obj = ApiRos(sock)
    if str(router) == "10.20.11.61":
        password = "P@55w0rd!##7"
    else:
        password = "P@55w0rd!#"

    if obj.login("admin", password):
        octets = router.split(".")
        filename = f"=REMOTE_BRANCH{octets[3]}"
        command=["/export", filename]
        obj.talk(command)
        print(f"Backup concluido em : {router}")
        connect_to_ftp(f"REMOTE_BRANCH{octets[3]}.rsc", router)