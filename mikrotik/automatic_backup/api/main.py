from api_client import ApiRos
from conect_to_device import open_connection
from ipaddress import ip_network
from ping3 import ping
from ftp_client import connect_to_ftp, interact_with_ftp
from time import sleep
from os import getenv


def main(rede, password, spec_password, spec_ip):

    try:
        address = ip_network(rede)
        ips = address.hosts()
    except:
        print("O Endereco de rede inserido e invalido")
        return


    for ip in ips:
        if ping(str(ip), timeout=1):
            backup(str(ip), password, spec_password, spec_ip)

    print("Backup Concluido")


def backup(router, normal_password, spec_password, spec_ip):

    try: 
        sock = open_connection(router, 8728, False)
        if sock:

            obj = ApiRos(sock)
            if str(router) == spec_ip:
                password = spec_password
            else:
                password = normal_password

            if obj.login("admin", password):
                octets = router.split(".")
                filename = f"API_BRANCH{octets[3]}"
                command=["/export", f"=file={filename}"]
                obj.talk(command)
                print(f"Backup concluido em : {router}")
                interact_with_ftp(obj, "enable")
                sleep(2)
                try:
                    connect_to_ftp(filename + ".rsc", router, password)
                except:
                    print("Erro ao conecar-se com o servidor FTP")
                interact_with_ftp(obj, "disable")
    
    except:
        print(f"Erro ao conectar com o router: {router}")

if __name__ == "__main__":

    rede=input("Insira a rede que possui os routers: ")
    password=getenv("NORMAL_PASSWORD")
    spec_password=getenv("SPEC_PASSWORD")
    spec_ip=getenv("SPEC_IP")
    main(rede, password, spec_password, spec_ip)