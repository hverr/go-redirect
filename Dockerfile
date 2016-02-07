FROM golang:latest
MAINTAINER Henri Verroken <henriverroken@gmail.com>

RUN go get -v github.com/hverr/go-redirect && \
    cd $GOPATH/src/github.com/hverr/go-redirect && \
    go build && \
    mv go-redirect /usr/local/bin

CMD [ "go-redirect" ]
