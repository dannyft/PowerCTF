FROM kalilinux/kali-linux-docker
ENV LC_CTYPE C.UTF-8

RUN apt-get update && apt-get upgrade -yqq && apt-get dist-upgrade -yqq
RUN apt-get install -y kali-linux-top10
RUN apt-get autoremove && apt-get autoremove
