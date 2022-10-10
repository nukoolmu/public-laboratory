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


2. 