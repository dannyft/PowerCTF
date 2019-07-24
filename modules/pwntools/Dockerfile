FROM ubuntu:18.04
ENV LC_CTYPE C.UTF-8

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python2.7 python-pip python-dev git libssl-dev libffi-dev build-essential ipython python-virtualenv
RUN pip install --upgrade pip
RUN pip install --upgrade pwntools requests
RUN apt-get autoremove -y && apt-get clean -y

CMD [ "ipython", "-i", "--no-banner", "-c", "from pwn import *"]
