FROM python:3.11-slim

LABEL maintainer="MyslivetsOleg"
LABEL kind="test-only" 
ARG APP_VERSION=1.1

RUN mkdir /app
WORKDIR /app
COPY app/ /app/

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir -r /tmp/requirements.txt

EXPOSE 5000


ENV app_user="appuser" \
    db_user="default_user" \
    db_pass="default_pass" \
    db_server_ip="localhost" \
    db_port="5432" \
    fad_app_version=${APP_VERSION}

RUN groupadd -r $app_user && useradd -g $app_user $app_user && chown -R $app_user:$app_user /app
USER $app_user

CMD [ "python","main.py" ]
