
FROM golang:1.19-alpine


WORKDIR /app
COPY go.mod go.sum ./


RUN go mod download
COPY . .

RUN go build -o main .


EXPOSE 8080

# Command to run the executable
CMD ["./main"]
