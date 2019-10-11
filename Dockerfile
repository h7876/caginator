############################
# STEP 1 build executable binary
############################
#FROM golang:1.13rc1-alpine AS builder
FROM golang:1.13rc1-alpine
# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git
RUN go get github.com/githubnemo/CompileDaemon
# Create appuser.
RUN adduser -D -g '' appuser
WORKDIR /caginator
#WORKDIR $GOPATH/src/mypackage/myapp/
#COPY . .

# Fetch dependencies.
# Using go get.
#RUN go get -d -v
# Using go mod.
#RUN go mod download
#RUN go mod verify
# Build the binary.
USER appuser
EXPOSE 8080
ENTRYPOINT CompileDaemon -log-prefix=false -build="go build -mod=vendor -v -o app ./" -command="./app"
#RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/hello

#############################
## STEP 2 build a small image
#############################
#FROM scratch
## Import the user and group files from the builder.
#COPY --from=builder /etc/passwd /etc/passwd
## Copy our static executable.
#COPY --from=builder /go/bin/hello /go/bin/hello
## Use an unprivileged user.
#USER appuser
## Run the hello binary.
#ENTRYPOINT ["/go/bin/hello"]
