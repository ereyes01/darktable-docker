# Darktable Docker Image

This repository helps you maintain a Docker image that builds [Darktable](https://www.darktable.org/) from source in the Ubuntu 16.04 environment.

To build a Docker image:

```
$ docker build --rm -t darktable ./
```

By default, version 2.3.0 is built (and it is the version I've tested with this Dockerfile). If you would like to build a different version, run:

```
$ docker build --rm --build-arg version=2.2.4 -t darktable ./
```

Also, a convenience script (`darktable`) is provided to run the darktable program once you've built the Docker image. Copy it somewhere within your $PATH for easy access.
