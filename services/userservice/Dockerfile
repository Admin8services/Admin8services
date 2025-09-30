# Sử dụng multi-stage build để tối ưu image size
# Stage 1: Build
FROM golang:1.21-alpine AS builder

WORKDIR /build

# Copy go.mod và go.sum và tải dependencies
COPY go.mod go.sum ./
RUN go mod download

# Copy source code và build
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o /app/userservice ./services/userservice

# Stage 2: Run
FROM alpine:latest

WORKDIR /app

# Copy file binary đã build từ stage builder
COPY --from=builder /app/userservice .

# Expose port (nếu service có server HTTP/gRPC)
# EXPOSE 8081

# Command để chạy service
CMD ["./userservice"]
