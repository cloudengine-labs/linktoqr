FROM golang:alpine

# Set necessary environmet variables needed for our image
ENV CGO_ENABLED=0 \
    GOOS=linux

WORKDIR $GOPATH/src/linktoqr

COPY ./*go* .

RUN go build -o /linktoqr 

# Export necessary port
EXPOSE 1718

CMD ["/linktoqr"]
