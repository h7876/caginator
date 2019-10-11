

RUN go get github.com/githubnemo/CompileDaemon

WORKDIR /caginator

EXPOSE 8080

ENTRYPOINT CompileDaemon -log-prefix=false -build="go build -mod=vendor -v -o app ./" -command="./app"

