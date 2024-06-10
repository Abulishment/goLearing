FROM golang:latest as builder
WORKDIR /app  
COPY ./ ./  
RUN GOOS=linux GOARCH=amd64 go build -o server .

FROM ubuntu:latest  
WORKDIR /app
EXPOSE 9999
COPY --from=builder /app/server /app/server  
ENTRYPOINT [ "./server" ]