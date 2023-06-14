FROM golang:alpine

# Set necessary environmet variables needed for our image
ENV GO111MODULE=on \
    CGO_ENABLED=0 \
    GOOS=linux \
    GOARCH=amd64

WORKDIR /root/go/src/linktoqr

COPY . .

RUN go install -v ./...

# Export necessary port
EXPOSE 1718

CMD ["linktoqr"]
