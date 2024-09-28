# Stage 1: Build the Go binary
FROM golang:1.22.1-alpine AS builder

RUN mkdir /app

# Copy the source code to /app
COPY . /app

WORKDIR /app

# Build the authApp binary
RUN CGO_ENABLED=0 go build -o authApp ./cmd/api

# Stage 2: Create a minimal image with just the binary
FROM alpine:latest

RUN mkdir /app

# Copy the authApp binary from the builder stage
COPY --from=builder /app/authApp /app

# Make sure the binary is executable
RUN chmod +x /app/authApp

# Set the command to run the authApp
CMD [ "/app/authApp" ]