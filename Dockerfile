FROM golang:1.23.1

WORKDIR /app

COPY go.mod go.sum /app/
RUN go mod download

COPY . /app

RUN CGO_ENABLED=0 GOOS=linux go build -o main

EXPOSE 80

CMD ["./main"]
