FROM golang:stretch

RUN apt-get update && apt-get install -y git make
RUN go get github.com/Ne0nd0g/merlin/...

WORKDIR $GOPATH/src/github.com/Ne0nd0g/merlin
CMD ["go", "run", "cmd/merlinserver/main.go", "-i", "0.0.0.0"]
