# hercules-tk5
[The MVS 3.8j Tur(n)key System 5 Update 4](https://www.prince-webdesign.nl/tk5)

## How to build

**This container requires a local image of [M3-Repos/docker-hercules](https://github.com/M3-Repos/docker-hercules).**

```
git clone https://github.com/m3-repos/hercules-tk5
docker build --tag m3-repos/tk5 hercules-tk5
```

## How to run
```
docker run -ti -p 3270:3270 -p 8038:8038 tk5
```

*Tested in a rootless podman environment under Fedora Linux & macOS*
