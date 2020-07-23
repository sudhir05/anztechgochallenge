FROM golang:alpine as techbuilder

ENV GO111MODULE=on

WORKDIR /app

#Copying required files only
COPY go.mod go.sum ./

#Download go dependencies
RUN go mod download

#Copy application code
COPY main.go ./

#Build the code
RUN apk update --no-cache \
&& apk add git \
&& CGO_ENABLED=0 go build -o golang-test .

#final stage to reduce size where only binaries will be copied 
FROM scratch

COPY --from=techbuilder /app/golang-test /app/

ENTRYPOINT ["/app/golang-test"]

EXPOSE 8000