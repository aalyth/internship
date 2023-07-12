FROM golang:latest

WORKDIR /app
COPY ./* ./
RUN go mod download
RUN go build -o /app/srv 

EXPOSE 1337 

CMD ["/app/srv"]
