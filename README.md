# hercules-tk5
[The MVS 3.8j Tur(n)key System 5 Update 4](https://www.prince-webdesign.nl/tk5)

## How to build

```
docker build --tag m3-repos/tk5 https://github.com/m3-repos/hercules-tk5.git
```

## How to run
```
docker run -d \
        --cap-add=NET_ADMIN,SYS_NICE \
        -p 3270:3270 -p 8038:8038 tk5
```
