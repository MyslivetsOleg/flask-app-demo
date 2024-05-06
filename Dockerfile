FROM python:3

LABEL maintainer="MyslivetsOleg"
LABEL kind="test-only" 

RUN mkdir /app
WORKDIR /app
COPY app/ /app/
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

ENV app_user="appuser"

ARG db_user="default_user"
ARG db_pass="default_pass"
ARG db_server_ip="localhost"
ARG db_port="5432"

RUN groupadd -r $app_user && useradd -g $app_user $app_user
RUN chown -R $app_user:$app_user /app
USER $app_user

CMD [ "python","main.py" ]
