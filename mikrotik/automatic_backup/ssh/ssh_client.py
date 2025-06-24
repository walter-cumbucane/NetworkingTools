import paramiko
from mikrotik.automatic_backup.ftp_client import connect_to_ftp

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

    value = connect_to_ftp(filename + ".rsc", ip)
    return value