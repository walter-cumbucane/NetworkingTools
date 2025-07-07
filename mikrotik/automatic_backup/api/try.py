from mikrotik.automatic_backup.web.api_client import ApiRos
from mikrotik.automatic_backup.web.conect_to_device import open_connection
from ipaddress import ip_network
from ping3 import ping
from mikrotik.automatic_backup.web.ftp_client import connect_to_ftp


 
sock = open_connection("10.20.11.9", 8728, False)

if sock:

    obj = ApiRos(sock)
        
    if obj.login("admin", "P@55w0rd!#"):
        ftp_id = None
        for reply, attrs in obj.talk(["/ip/service/print"]):
            if reply == "!re" and attrs["=name"] == "ftp":
                ftp_id = attrs["=.id"]
                break
        if not ftp_id:
            print("Servico FTP nao encontrado")

        command = ["/ip/service/set", f"=.id={ftp_id}", "=disabled=yes"]
        obj.talk(command)
        print("FTP is on right now")
                

    else:
        print(f"Autenticacao falhou")