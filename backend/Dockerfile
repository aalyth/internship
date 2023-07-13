FROM golang:latest

WORKDIR /app
COPY ./server.go ./
COPY ./go.* ./
RUN go mod download
RUN go build -o /app/srv 

EXPOSE 1337 

CMD ["/app/srv"]
