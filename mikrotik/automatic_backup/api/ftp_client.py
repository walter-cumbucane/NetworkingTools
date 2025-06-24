from ftplib import FTP

def connect_to_ftp(filename, ip):
    try:
        client = FTP(ip)

        if ip == "10.20.11.61":
            password = "P@55w0rd!##7"
        else:
            password = "P@55w0rd!"
        client.login("admin", password)
    except:
        return 0
    value = download_file(filename, client)


def download_file(filename, client):

    with open(filename, "wb") as f:
        client.retrbinary(f"RETR {filename}", callback=f.write)

    client.quit()
    return 1