FROM golang:1.22.2

WORKDIR /app

COPY go.mod go.sum /app/
RUN go mod download

COPY . /app

RUN CGO_ENABLED=0 GOOS=linux go build main.go

EXPOSE 80

CMD ["./main"]
