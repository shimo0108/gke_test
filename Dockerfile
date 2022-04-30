FROM golang:1.18.1
WORKDIR /Users/shimosasashouta/go/src/github.com/shimo0108/gke_test
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /Users/shimosasashouta/go/src/github.com/shimo0108/gke_test/app .
CMD ["./app"]