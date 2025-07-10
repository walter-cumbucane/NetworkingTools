from flask import Flask, render_template, request
from main import start_backup

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/backup", methods=['POST'])
def backup():
    network = request.form["networkAddress"]
    username = request.form["username"]
    password = request.form["password"]
    start_backup(network, username, password)
    return render_template("backup.html")


def main():
    app.run()


if __name__ == "__main__":
    main()