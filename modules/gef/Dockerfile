FROM ubuntu:18.04
ENV LC_CTYPE C.UTF-8

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y strace ltrace git python python-pip python3 python3-pip wget gdb build-essential
RUN apt-get install -y libc6-i386 libdb-dev libxt-dev libxaw7-dev libc6:i386 libncurses5:i386 libstdc++6:i386
RUN wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh
RUN pip install capstone requests pwn r2pipe
RUN pip3 install unicorn capstone ropper keystone-engine
RUN git clone https://github.com/JonathanSalwan/ROPgadget /opt/ROPgadget
RUN apt-get autoremove -y && apt-get clean -y
