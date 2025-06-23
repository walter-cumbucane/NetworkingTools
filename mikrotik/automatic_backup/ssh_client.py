import paramiko
from ftp_client import connect

def backup(ip):
    client = paramiko.SSHClient()
    client.set_missing_host_key_policy(paramiko.AutoAddPolicy())

    try:
        client.connect(ip, port=2222, username="admin", password="P@55w0rd!#")
    except:
        return 0
    octets = ip.split(".")
    filename = f"REMOTE_BRANCH{octets[3]}"
    stdin, stdout, stderr = client.exec_command(f"export file={filename}")
    error = stderr.read().decode()
    output = stderr.read().decode()

    if error:
        print(f"Error: {error}")
    else:
        print(f"Backup successfully created on the router: {ip}")

    value = connect(filename + ".rsc", ip)
    return value