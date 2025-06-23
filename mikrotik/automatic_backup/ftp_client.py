from ftplib import FTP

def connect(filename, ip):
    try:
        client = FTP(ip)
        client.login("admin", "P@55w0rd!#")
    except:
        return 0
    value = download(filename, client)


def download(filename, client):

    with open(filename, "wb") as f:
        client.retrbinary(f"RETR {filename}", callback=f.write)

    client.quit()
    return 1