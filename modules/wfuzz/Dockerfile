FROM alpine:latest
ENV LC_CTYPE C.UTF-8

RUN apk update && apk upgrade
RUN apk add --no-cache python3 curl-dev gcc python3-dev musl-dev
RUN pip3 install wfuzz

#
# User lock down
#

RUN addgroup wfuzz && adduser -G wfuzz -g "wfuzz user" -s /bin/sh -D wfuzz
RUN export RANDOM_PASSWORD=`tr -dc A-Za-z0-9 < /dev/urandom | head -c44` \
    && echo "root:$RANDOM_PASSWORD" | chpasswd \
    && unset RANDOM_PASSWORD \
    && passwd -l root
USER wfuzz