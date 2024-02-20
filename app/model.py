from sqlalchemy import Integer, String
from sqlalchemy.orm import Mapped, mapped_column

from main import db

class OS_Command(db.Model):
    __tablename__='os_commands'
    command_id = db.Column(Integer(),primary_key=True, autoincrement=True)
    command_input = db.Column(String())
    command_output = db.Column(String())
    command_time = db.Column(db.DateTime(timezone=True))
    
    def __init__(self, command_input, command_output, command_time):
        self.command_input = command_input
        self.command_output = command_output
        self.command_time = command_time