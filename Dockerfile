FROM golang:1.17.5-alpine3.15 as dev
RUN apk update && apk add git
WORKDIR /go/src/github.com/jorgeuos/go-gh-cli

FROM golang:1.17.5-alpine3.15 as build
RUN apk update && apk add git
COPY ./ggc /go/src/github.com/jorgeuos/go-gh-cli
WORKDIR /go/src/github.com/jorgeuos/go-gh-cli
RUN go build -o ggc
RUN go install

FROM alpine as runtime 
COPY --from=build /go/src/github.com/jorgeuos/go-gh-cli/ggc /usr/local/bin/ggc
COPY run.sh /
RUN chmod +x /run.sh
ENTRYPOINT [ "./run.sh" ]
