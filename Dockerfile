FROM golang:alpine

LABEL org.opencontainers.image.source=https://github.com/chefgs/linktoqr
LABEL org.opencontainers.image.description="This container image can be used to generate QR from the given URL or Text."
LABEL org.opencontainers.image.licenses=MIT

# Set necessary environmet variables needed for our image
ENV CGO_ENABLED=0 \
    GOOS=linux

WORKDIR $GOPATH/src/linktoqr

COPY ./*go* .

RUN go build -o /linktoqr 

# Export necessary port
EXPOSE 1718

CMD ["/linktoqr"]
