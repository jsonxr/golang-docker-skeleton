FROM golang:1.12 as build
RUN apt-get update &&\
    apt-get install ca-certificates -y

FROM golang:1.12 as compile
WORKDIR /go/src/hello-google
COPY  main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hello-google hello-google .

FROM scratch
COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY --from=compile /go/src/hello-google/hello-google /hello-google
CMD ["/hello-google"]
