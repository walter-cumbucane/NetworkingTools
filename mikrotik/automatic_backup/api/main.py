from api_client import ApiRos
from conect_to_device import open_connection
from ipaddress import ip_network
from ping3 import ping
from ftp_client import connect_to_ftp, interact_with_ftp
from time import sleep


def main():

    rede = ip_network("10.20.11.0/24")
    for ip in rede.hosts():
        if ping(str(ip), timeout=1):
            backup(str(ip))


def backup(router):

    try: 
        sock = open_connection(router, 8728, False)
        if sock:

            obj = ApiRos(sock)
            if str(router) == "10.20.11.61":
                password = "P@55w0rd!##7"
            else:
                password = "P@55w0rd!#"

            if obj.login("admin", password):
                octets = router.split(".")
                filename = f"API_BRANCH{octets[3]}"
                command=["/export", f"=file={filename}"]
                obj.talk(command)
                print(f"Backup concluido em : {router}")
                interact_with_ftp(obj, "enable")
                sleep(2)
                try:
                    connect_to_ftp(filename + ".rsc", router)
                except:
                    print("Erro ao conecar-se com o servidor FTP")
                interact_with_ftp(obj, "disable")
    
    except:
        print(f"Erro ao conectar com o router: {router}")

if __name__ == "__main__":
    main()
    print("Backup Concluido")