# public-laboratory
for training and workshop

## How to build

1. app-a

```Dockerfile
    docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%S') -f Dockerfile-appA .  -t [Your repository]
```

1. app-b

```Dockerfile
    docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%S') -f Dockerfile-appB .  -t [Your repository]
```

1. ingress

```Dockerfile
    docker build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%S') -f Dockerfile-ingress .  -t [Your repository]
```

## run container with docker

```
docker run -d --name be-1 nukoolm/myexample:app-a

docker run -d --name be-2 nukoolm/myexample:app-b

docker run -d --name ingress -p 80:80 --link be-1:be-1 --link be-2:be-2 nukoolm/myexample:ingress
```

