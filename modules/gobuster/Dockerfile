FROM alpine:latest
ENV LC_CTYPE C.UTF-8

ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN apk update && apk upgrade
RUN apk add --no-cache git make musl-dev go fish

RUN go get github.com/OJ/gobuster

#
# User lock down
#

RUN addgroup gobuster && adduser -G gobuster -g "Gobuster user" -s /bin/sh -D gobuster
RUN export RANDOM_PASSWORD=`tr -dc A-Za-z0-9 < /dev/urandom | head -c44` \
    && echo "root:$RANDOM_PASSWORD" | chpasswd \
    && unset RANDOM_PASSWORD \
    && passwd -l root
USER gobuster
