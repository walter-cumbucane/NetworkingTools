from api_client import ApiRos
from conect_to_device import open_connection
from ipaddress import ip_network
from ping3 import ping
from ftp_client import connect_to_ftp, interact_with_ftp
from time import sleep


def start_backup(network, username, password):

    rede = ip_network(network)
    for ip in rede.hosts():
        if ping(str(ip), timeout=1):
            backup(str(ip), username, password)


def backup(router, username, password):

    try: 
        sock = open_connection(router, 8728, False)
        if sock:

            obj = ApiRos(sock)

            if obj.login(username, password):
                octets = router.split(".")
                filename = f"BRANCH_{octets[3]}"
                command=["/export", f"=file={filename}"]
                obj.talk(command)
                print(f"Backup concluido em : {router}")
                interact_with_ftp(obj, "enable")
                sleep(2)
                try:
                    connect_to_ftp(filename + ".rsc", router, username, password)
                except:
                    print("Erro ao conecar-se com o servidor FTP")
                interact_with_ftp(obj, "disable")
    
    except:
        print(f"Erro ao conectar com o router: {router}")