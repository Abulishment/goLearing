FROM golang:latest as server
WORKDIR /app  
COPY . .  
EXPOSE 9999
RUN GOOS=linux GOARCH=amd64 go build -o server .
RUN apt-get update && apt-get install -y netcat-traditional
ENTRYPOINT [ "./server" ]