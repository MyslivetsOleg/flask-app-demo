CREATE TABLE os_commands (
    command_id SERIAL NOT NULL PRIMARY KEY,
    command_input TEXT,
    command_output TEXT,
    command_time  TIMESTAMPTZ
)