# public-laboratory
## Docker 400 Admin

### Pre-prerequisite

1. Register account hub.docker.com 

         ``` docker lougin -u <user> ```

1. Docker Runtime


### 0. Registration and Repository walkthrough [link here](https://hub.docker.com/signup)


### 1. Docker Build

a. Create new dockerfile

[!dockerfile](./image/dockerfile.png)

```Dockerfile 

FROM node

WORKDIR /app

ADD ./src/* .

RUN npm install express

CMD node server.js


 ```

b. Build new images by dockerfiles

```
docker build -t $user .
```

c. Run your new container with new image

```
docker run --name -d -p 80:80 myapp-01 $user .
```

d. test called your application with curl as VMs hosted

```
curl 127.0.0.1:80/
```

e. Workshop : edit respose message as file server.js and build new image name `${user}:2.0.0` and run container for new images


### 1. Image Share
[!dockerhub](./image/docker-hup.png)

a. Tag your local image

```
docker tag ${user} your_repos/${user}:1.0.0
```

b. push your local image to docker registry as your repository

c. check your repository