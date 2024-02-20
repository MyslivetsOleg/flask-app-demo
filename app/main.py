import os
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db_pass = os.environ.get('db_pass')
app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = "postgresql://appadmin:"+str(db_pass)+"@192.168.3.248:5432/os_commands"
db = SQLAlchemy(app)

if __name__ == '__main__':
 
    from views import *
    # run() method of Flask class runs the application 
    # on the local development server.
    app.run(host='0.0.0.0')