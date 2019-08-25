FROM golang:1.10

WORKDIR /go/src/cage

RUN go get github.com/githubnemo/CompileDaemon

## This container exposes port 8080 to the outside world
EXPOSE 8080

#ENTRYPOINT CompileDaemon -log-prefix=false -build="go build ./" -command="./cage dev"
ENTRYPOINT CompileDaemon -log-prefix=false -build="go build -v -o -mod vendor cage-dev ./" -command="./cage-dev dev"
