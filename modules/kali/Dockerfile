FROM kalilinux/kali-linux-docker
ENV LC_CTYPE C.UTF-8

LABEL version="0.1"
LABEL description="Kali linux only contaning CLI tools"
LABEL homepage="https://github.com/dannyft/PowerCTF"

RUN apt-get update && apt-get upgrade -yqq && apt-get dist-upgrade -yqq && apt-get install -y \
    apache-users \
    automater \
    bbqsql \
    blindelephant \
    davtest \
    dnmap \
    dotdotpwn \
    grabber \
    fierce \
    hamster-sidejack \
    hydra \
    joomscan \
    lbd \
    mitmproxy \
    ncrack \
    nishang \
    nmap \
    padbuster \
    plecost \
    proxychains \
    proxytunnel \
    recon-ng \
    routersploit \
    set \
    smbmap \
    sidguesser \
    skipfish \
    slowhttptest \
    sqlmap \
    sqlninja \
    sqlsus \
    sslcaudit \
    ssldump \
    sslh \
    sslscan \
    sslsniff \
    sslstrip \
    sslsplit \
    stunnel4 \
    thc-ssl-dos \
    tnscmd10g \
    tshark \
    ua-tester \
    weevely \
    whatweb \
    wpscan \
    && apt-get autoremove -y && apt-get clean -y
