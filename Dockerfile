ARG TARG_ARCH=amd64
FROM --platform=linux/${TARG_ARCH} quay.io/projectquay/golang:1.20 AS builder

WORKDIR /go/src/app
COPY . .
RUN make build GOOS=linux GOARCH=${TARG_ARCH}

FROM alpine
WORKDIR /
COPY --from=builder /go/src/app/bot .
ENTRYPOINT ["./bot"]
CMD [ "start" ]