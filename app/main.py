import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db_pass = os.environ.get('db_pass')
db_user = os.environ.get('db_user')
db_server_ip = os.environ.get('db_server_ip')
db_port=os.environ.get('db_port')


app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://"+str(db_user)+":"+str(db_pass)+ \
                                        "@"+str(db_server_ip)+":"+str(db_port)+"/os_commands"
db = SQLAlchemy(app)

if __name__ == '__main__':
 
    from views import *
    # run() method of Flask class runs the application 
    # on the local development server.
    app.run(host='0.0.0.0')