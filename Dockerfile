FROM python:3.11

LABEL maintainer="MyslivetsOleg"
LABEL kind="test-only" 

RUN mkdir /app
WORKDIR /app
COPY app/ /app/
RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 5000

ARG APP_VERSION=1.1

ENV app_user="appuser"

ENV db_user="default_user"
ENV db_pass="default_pass"
ENV db_server_ip="localhost"
ENV db_port="5432"

RUN groupadd -r $app_user && useradd -g $app_user $app_user
RUN chown -R $app_user:$app_user /app
USER $app_user

CMD [ "python","main.py" ]
