from ftplib import FTP

def connect_to_ftp(filename, ip, password):
    try:
        client = FTP(ip)
    except:
        print("Falha ao conectar-se ao servidor")
        return
    
    try:    
        client.login("admin", password)
    except:
        print("Autenticacao falhou no servidor FTP")
        return

    value = download_file(filename, client)


def download_file(filename, client):

    with open(filename, "wb") as f:
        client.retrbinary(f"RETR {filename}", callback=f.write)

    client.quit()
    return 1

def interact_with_ftp(obj, action):
    ftp_id = None
    for reply, attrs in obj.talk(["/ip/service/print"]):
        if reply == "!re" and attrs["=name"] == "ftp":
            ftp_id = attrs["=.id"]
            break
    if not ftp_id:
        print("Servico FTP nao encontrado")

    if action == "enable":
        command = ["/ip/service/set", f"=.id={ftp_id}", "=disabled=no"]
    else:
        command = ["/ip/service/set", f"=.id={ftp_id}", "=disabled=yes"]

    obj.talk(command)
    return