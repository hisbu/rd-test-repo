from flask import Flask
# import logging


app = Flask(__name__)

@app.route("/")
def index():
  return 'Hello World!'

@app.route('/hello')
def hello():
    return 'Hello, dunia'
    
@app.errorhandler(404)
def not_found(error):
    return "404 Not Found", 404

if __name__ == '__main__':
  app.run(debug=True)
  # app.run()

