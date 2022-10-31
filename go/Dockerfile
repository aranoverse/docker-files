#docker build -t aranoverse/cmd:1.0 -f Dockerfile ..
FROM golang:alpine as builder
RUN apk --no-cache add git
COPY  . /builder
WORKDIR  /builder
ENV GO111MODULE=on GOPROXY=https://goproxy.cn,direct  CGO_ENABLED=0
RUN  go build -v -o cmd ./cmd

FROM scratch as app
RUN apk --no-cache add ca-certificates
MAINTAINER Arano "aranoverse@outlook.com"
WORKDIR /app
COPY --from=builder /builder/cmd  cmd
ENV GIN_MODE=release
ENTRYPOINT  ["./cmd"]
CMD ["--config","config.yaml"]

