import datetime
import subprocess
from flask import render_template, request

from model import OS_Command
from main import db, app


@app.route('/')
def hello_world():
    return 'Welcome to Monitor App Version 0.1'

@app.route('/cmd/<command>')
def run_os_command(command:str):    
    dt = datetime.datetime.now()
    result = subprocess.Popen(command, shell=True, stdout=subprocess.PIPE).stdout.read()
    new_os_command = OS_Command(command,result.decode("utf8"),dt)
    db.session.add(new_os_command)
    db.session.commit()
    return result
   
    
@app.route('/list', methods=['GET'])
def get_list_of_commands():
    query = OS_Command.query.all()    
    return render_template("list.html", title="List of Commands", list=query)