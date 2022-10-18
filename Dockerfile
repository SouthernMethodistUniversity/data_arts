# docker build -t data_arts:latest .
# docker build --platform linux/amd64 -t data_arts:latest .
# docker build --no-cache --progress=plain -t data_arts:latest .
# docker run --entrypoint /bin/bash -it data_arts:latest

FROM ubuntu:22.04
LABEL maintainer "Robert Kalescky <rkalescky@smu.edu>"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update &&\
 apt-get install -y\
 python3\
 python3-pip\
 python3-matplotlib\
 python3-scipy\
 python3-pandas\
 python3-pyodbc\
 git\
 gpg-agent\
 curl\
 zsh

RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - &&\
 curl https://packages.microsoft.com/config/ubuntu/22.04/prod.list\
 > /etc/apt/sources.list.d/mssql-release.list &&\
 apt-get update &&\
 ACCEPT_EULA=Y apt-get -y install msodbcsql18 unixodbc-dev

RUN pip install jupyterlab

