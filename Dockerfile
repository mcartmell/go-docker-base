# Stage 1: build the Go binary
FROM golang:1.24-alpine AS builder

WORKDIR /app

# Install dependencies first for efficient caching of docker builds
COPY go.mod go.sum ./
RUN go mod download

# Copy rest of the app
COPY . .

# Build the app
RUN go build -o app

# Stage 2: run the binary
FROM alpine:3.21

WORKDIR /app

COPY --from=builder /app/app .

EXPOSE 8080

CMD ["./app"]
