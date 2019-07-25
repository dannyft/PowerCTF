FROM kalilinux/kali-linux-docker
ENV LC_CTYPE C.UTF-8

LABEL version="0.1"
LABEL description="Kali linux only contaning CLI tools"
LABEL homepage="https://github.com/dannyft/PowerCTF"

# RUN apt-get update
# && apt-get upgrade -yqq && apt-get dist-upgrade -yqq

RUN apt-get update && apt-get upgrade -yqq && apt-get dist-upgrade -yqq && apt-get install -y \
    apache-users \
    automater \
    bbqsql \
    blindelephant \
    davtest \
    dnmap \
    dotdotpwn \
    grabber \
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
    # uniscan \
    weevely \
    whatweb \
    wpscan \
    && apt-get autoremove -y && apt-get clean -y

#
# Information Gathering
#
# RUN apt-get install -y \
#     ace-voip \
#     amap \
#     apt2 \
#     arp-scan \
#     automater \
#     # bing-ip2hosts \
#     braa \
#     cdpsnarf \
#     cisco-torch \
#     copy-router-config \
#     dmitry \
#     dnmap \
#     dnsenum \
#     dnsmap \
#     dnsrecon \
#     dnstracer \
#     dnswalk \
#     dotdotpwn \
#     enum4linux \
#     enumiax \
#     eyewitness \
#     fierce \
#     firewalk \
#     fragroute \
#     fragrouter \
#     golismero \
#     goofile \
#     hping3 \
#     ident-user-enum \
#     inspy \
#     intrace \
#     ismtp \
#     lbd \
#     masscan \
#     metagoofil \
#     miranda \
#     nbtscan-unixwiz \
#     nmap \
#     osrframework \
#     p0f \
#     parsero \
#     recon-ng \
#     set \
#     smbmap \
#     smtp-user-enum \
#     snmpcheck \
#     sslcaudit \
#     sslsplit \
#     sslstrip \
#     thc-ipv6 \
#     voiphopper \
#     wifi-honey \
#     tshark

#
# Vulnerability Analysis
#
# RUN apt-get install -y \
#     bbqsql \
#     bed \
#     cisco-auditing-tool \
#     cisco-global-exploiter \
#     cisco-ocs \
#     doona \
#     lynis \
#     ohrwurm \
#     # openvas \
#     oscanner \
#     sfuzz \
#     sidguesser \
#     siparmyknife \
#     sqlmap \
#     sqlninja \
#     sqlsus \
#     tnscmd10g \
#     unix-privesc-check

#
# Exploitation Tools
#
# RUN apt-get install -y \
#     backdoor-factory \
#     beef-xss \
#     commix \
#     crackle \
#     exploitdb \
#     jboss-autopwn \
#     linux-exploit-suggester \
#     routersploit \
#     shellnoob

#
# Wireless Attacks
#
# RUN apt-get install -y \
#     aircrack-ng \
#     asleap \
#     bluelog \
#     blueranger \
#     bluesnarfer \
#     bully \
#     cowpatty \
#     eapmd5pass \
#     freeradius-wpe \
#     giskismet \
#     # gr-scan \
#     hostapd-wpe \
#     kalibrate-rtl \
#     killerbee \
#     mdk3 \
#     mfcuk \
#     mfoc \
#     mfterm \
#     pixiewps \
#     pyrit \
#     reaver \
#     redfang \
#     spooftooph \
#     wifiphisher \
#     wifitap \
#     wifite

#
# Forensics Tools
#
# RUN apt-get install -y \
#     binwalk \
#     bulk-extractor \
#     chntpw \
#     cuckoo \
#     dc3dd \
#     ddrescue \
#     # distorm3 \
#     dumpzilla \
#     extundelete \
#     foremost \
#     galleta \
#     pdf-parser \
#     pdfid \
#     pdgmail \
#     peepdf \
#     volatility \
#     xplico

#
# Stress Testing
#
# RUN apt-get install -y \
#     dhcpig \
#     funkload \
#     iaxflood \
#     # inundator \
#     inviteflood \
#     ipv6-toolkit \
#     rtpflood \
#     slowhttptest \
#     t50 \
#     termineter \
#     thc-ssl-dos

#
# Web Applications
#
# RUN apt-get install -y \
#     apache-users \
#     arachni \
#     blindelephant \
#     cutycapt \
#     davtest \
#     deblaze \
#     dirb \
#     fimap \
#     grabber \
#     hurl \
#     joomscan \
#     padbuster \
#     plecost \
#     skipfish \
#     ua-tester \
#     websploit \
#     whatweb \
#     wpscan

#
# Sniffing & Spoofing
#
# RUN apt-get install -y \
#     bettercap \
#     dnschef \
#     fiked \
#     hamster-sidejack \
#     hexinject \
#     isr-evilgrade \
#     mitmproxy \
#     protos-sip \
#     rebind \
#     responder \
#     rtpbreak \
#     rtpinsertsound \
#     rtpmixsound \
#     sctpscan \
#     sipp \
#     sipvicious \
#     sniffjoke

#
# Password Attacks
#
# RUN apt-get install -y \
#     brutespray \
#     cewl \
#     cmospwd \
#     creddump \
#     crowbar \
#     crunch \
#     findmyhash \
#     gpp-decrypt \
#     hash-identifier \
#     hashcat \
#     hydra \
#     john \
#     keimpx \
#     maskprocessor \
#     multiforcer \
#     ncrack \
#     oclgausscrack \
#     pack \
#     patator \
#     # phrasendrescher \
#     polenum \
#     rainbowcrack \
#     rcracki-mt \
#     rsmangler \
#     statsprocessor \
#     thc-pptp-bruter \
#     truecrack

#
# Maintaining Access
#
# RUN apt-get install -y \
#     cryptcat \
#     cymothoa \
#     dbd \
#     dns2tcp \
#     httptunnel \
#     intersect \
#     nishang \
#     powersploit \
#     pwnat \
#     ridenum \
#     sbd \
#     shellter \
#     u3-pwn \
#     webshells \
#     weevely \
#     winexe

#
# Reverse Engineering
#
# RUN apt-get install -y \
#     apktool \
#     dex2jar \
#     jad \
#     smali \
#     valgrind \
#     yara 

#RUN apt-get autoremove -y && apt-get clean -y
