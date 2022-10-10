# public-laboratory
## Docker 204 developer

>Docker can build images automatically by reading the instructions from a Dockerfile. A Dockerfile is a text document that contains all the commands a user could call on the command line to assemble an image. Using docker build users can create an automated build that executes several command-line instructions in succession.

## Format
Here is the format of the Dockerfile:

```Dockerfile
# Comment
INSTRUCTION arguments
```

- ADD
- COPY
- ENV
- EXPOSE
- FROM
- LABEL
- STOPSIGNAL
- USER
- VOLUME
- WORKDIR
- ONBUILD

---
0. frist build

```bash
cd lab-0

docker build -t lab-0:1.0.0 . 

```
- fix error with edit Dockerfile add line `FROM scratch` at frist line

1. Build docker image with base image

```bash
cd lab-1

docker build -t lab-1:1.0.0 . 

```

> workshop build the docker image from appache [HTTPD](https://hub.docker.com/_/httpd)


2. build with agrument and environment

```bash
cd lab-2
docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%S') -t lab-2:1.0.0 . 

```

3. DATA Structure and Copy file

```bash
cd lab-3
docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%S') -t lab-3:1.0.0 . 

```

>workshop 1 check path relate this lab 

>workshop 2 create new page and linked from frist page 

4. EXPOSE Ports

```bash
cd lab-4
docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%S') -t lab-4:1.0.0 . 
```

>workshop discussion about this workshop

5. onbuild command

```bash
cd lab-5
docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%S') -f Dockerfile-1st .  -t 1st-build 
```

>check the result of build  `docker run -it --rm 1st-build ls /usr/src`


```bash
cd lab-5
docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%S')  -t lab-05 .
```

>check the result of build  `docker run -it --rm lab-05 ls /usr/src`

6. Reduce Final Image Size

```bash
cd lab-6
docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%S')  -t lab-06 .
```

>workshop discussion this lab


