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
 python3-matplotlib\
 python3-scipy\
 python3-pandas\
 python3-pyodbc\
 git\
 lsb-release\
 wget\
 gnupg

RUN echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main"\
 > /etc/apt/sources.list.d/pgdg.list &&\
 wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

RUN apt-get update &&\
 apt-get -y install postgresql

RUN wget https://bootstrap.pypa.io/get-pip.py &&\
 python3 get-pip.py

RUN pip install jupyterlab

