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

