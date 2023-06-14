FROM golang:alpine

# Set necessary environmet variables needed for our image
ENV CGO_ENABLED=0 \
    GOOS=linux

WORKDIR /root/go/src/linktoqr

COPY . .

RUN go build -o /linktoqr 

# Export necessary port
EXPOSE 1718

CMD ["/linktoqr"]
