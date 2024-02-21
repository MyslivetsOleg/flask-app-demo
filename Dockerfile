FROM python:3

LABEL maintainer="MyslivetsOleg"
LABEL kind="test-only" 

RUN mkdir /app
WORKDIR /app
COPY app/ /app/
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

ARG db_user="default_user"
ARG db_pass="default_pass"
ARG db_server_ip="localhost"
ARG db_port="5432"

CMD [ "python","main.py" ]
