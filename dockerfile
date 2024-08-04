FROM golang:latest

# name of working directory is app
WORKDIR /app

# copy required files in /app (.)
COPY main.go .
COPY go.mod .

# run a command to build exe and put the output in "bin" folder in "/app" dir
RUN go build -o bin .

#entrypoint - where exe is placed after building
ENTRYPOINT [ "/app/bin" ]