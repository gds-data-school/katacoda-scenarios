from flask import Flask

app = Flask(__name__)

@app.route('/api/hello', methods=["GET"])
def get_hello():
    return 'Hello form Docker Microservice'

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8083)
