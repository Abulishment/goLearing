FROM golang:latest as server
WORKDIR /app  
COPY . .  
EXPOSE 9999
RUN GOOS=linux GOARCH=amd64 go build -o server .
ENTRYPOINT [ "./server" ]