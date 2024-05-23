# Start from the latest golang base image
FROM golang:alpine

# Add Maintainer Info
LABEL org.opencontainers.image.source=https://github.com/chefgs/linktoqr
LABEL description="This container image can be used to generate QR from the given URL or Text."
LABEL org.opencontainers.image.licenses=MIT

# Set necessary environment variables needed for our image
ENV CGO_ENABLED=0 \
    GOOS=linux \
    GO111MODULE=on

# Move to working directory /linktoqr
WORKDIR /linktoqr

# Copy and download dependency using go mod
COPY go.mod .
RUN go mod tidy

# Copy the code into the container
COPY . .

# Export necessary port
EXPOSE 1718

# Command to run the executable
CMD ["go", "run", "./..."]