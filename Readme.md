<h2>Prerequisites: </h2>
    a. Install GO SDK <br>
    b. Install Docker Desktop
<hr>

<h2>Steps to Containerize Go App via Docker </h2>
1. First I create a basic Go-App for hello world

2. Created a dockerfile, which helps in building container image, for our app
    in a dockerfile, we typically have 4 main points
   <ol>
    a. FROM - to indicate which version of SDK <br>
    b. WORKDIR - to specify working directory, to copy the files into <br>
    c. COPY command <br>
    d. ENTRYPOINT - which specify that when a container is created from an image, what command it must execute <br>
    e. RUN command -for creating exe <br>
   </ol>

3. After completing dockerfile, its time to create an image from it.
    Before that, mak sure yoou are logged in to Docker
   ```
    docker login
   ```
    (Put your username and pass)
    
    Then run following command
   ```
    docker build . -t go-containerized:latest
   ```
   This will give a name to our docker image as go-containerized <br>

4. Once terminal processing over... <br>
    Go to docker desktop and check the newly created image by us.

5. We can also check if the image is created via terminal
```
docker image ls
```

6. Run the image to create a container - which runs the code
    docker run go-containerized:latest

    As soon as we run the above command, we see the output of our go app.
    Just like we see when we do - go run main.go

--------------------------------------------------------------------------------------------------

Lets try with an API created via Gin Framework.

1. Create an endpoint using Gin framewok which returns a Status Ok and a Message

2. Run the main.go
   ```
     go run main.go
   ```
    Our app is listening to 8080 by default as mentioned in terminal.

4. To test the API
    We install a VS Code Plugin - Rest Client
    Then, we create a file - tests.http
    Then, we mention the request.
```
    GET http://localhost:8080/ping
```
 We see a button in file to "Send request"

On clicking this button, a new VS Code window pops up, with our repose.
Just like Postman or Thunder Client.

6. Exit the terminal.

7. To use this app in docker, we make a little modification in docker file. <br>
    RUN go get <br>
    This will crawl though the web and download all required dependecies to run our app. <br>

8. Create an image for the new changes
   ```
    docker build . -t go-containerized-ginapi:latest
   ```

10. Check if image created
```
docker image ls
```

11. Now we want to run our app and listen on a specific PORT, say 9000.  <br>
    For that we set the environment variable "PORT" to 9000 (-e PORT=9000)  <br>

    Then we specify, PORT for host machine : docker container (-p 9000:9000) <br>
```
    docker run -e PORT=9000 -p 9000:9000 go-containerized-ginapi:latest
```
12. Now if we go to tests.http, it has following command
    GET http://localhost:8080/ping  <br>
    This should fail, as we are now running on 9000.  <br>
    Then, try by changing the PORT.  <br>
    And it works.  <br>
This is how, we can create Backend APIs and host it in a Docker container and route them to listen to a port.  <br>

10. Create a Docker compose file
    So that we do not need to type/ remenber the commands 
    Just do
```
    docker compose up
```
Your image gets created, container starts running and listening to port 9000

Reference: https://www.youtube.com/watch?v=C5y-14YFs_8&list=LL&index=1
