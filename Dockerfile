FROM scratch
ADD hello-google /
ADD ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
CMD ["/hello-google"]
