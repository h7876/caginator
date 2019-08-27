FROM golang:1.11.0-stretch as builder

WORKDIR /caginator

COPY . ./

# Building using -mod=vendor, which will utilize the v
RUN CGO_ENABLED=0 GOOS=linux go build -mod=vendor -o app

FROM alpine:3.8

WORKDIR /root/

COPY --from=builder /caginator/app .

CMD ["./app"]