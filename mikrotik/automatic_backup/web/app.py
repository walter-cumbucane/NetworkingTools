from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/backup", methods=['POST'])
def backup():
    network = request.form["networkAddress"]
    print(network)
    return render_template("backup.html")


def main():
    app.run()


if __name__ == "__main__":
    main()