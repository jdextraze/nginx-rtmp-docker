# nginx-rtmp-docker

## Requirements

- Docker

## Build

```
docker build -t nginx-rtmp-module .
```

## Run

```
docker run -d --rm --name nginx-rtmp-module -p 1935:1935 -p 8080:8080 nginx-rtmp-module
```

Then open your favorite recent browser to http://localhost:8080/
