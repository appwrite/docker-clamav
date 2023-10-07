# Docker ClamAV

[![Discord](https://img.shields.io/discord/564160730845151244?label=discord&style=flat-square)](https://appwrite.io/discord)
[![Docker Pulls](https://img.shields.io/docker/pulls/appwrite/clamav?color=f02e65&style=flat-square)](https://hub.docker.com/r/appwrite/clamav)
[![Build Status](https://img.shields.io/travis/com/appwrite/docker-clamav?style=flat-square)](https://travis-ci.com/appwrite/docker-clamav)
[![Twitter Account](https://img.shields.io/twitter/follow/appwrite_io?color=00acee&label=twitter&style=flat-square)](https://twitter.com/appwrite_io)
[![Follow Appwrite on StackShare](https://img.shields.io/badge/follow%20on-stackshare-blue?style=flat-square)](https://stackshare.io/appwrite)

A ClamAV docker image with auto database updates by the [Appwrite team](https://github.com/appwrite). Use this image and a compatible client library to connect to the ClamAV using a TCP connection.

## Getting Started

These instructions will cover usage information to help your run ClamAV docker image

### Prerequisites

In order to run this image you'll need docker installed.

- [Windows](https://docs.docker.com/windows/started)
- [OS X](https://docs.docker.com/mac/started/)
- [Linux](https://docs.docker.com/linux/started/)

### Usage

```shell
docker run appwrite/clamav
```

#### Environment Variables

This image has no environment variables.

#### Volumes

You can mount any volume you need to allow the image to scan its files.

### Build / Release

```
docker build --tag appwrite/clamav:0.0.0 .
docker push appwrite/clamav:0.0.0
```

Multi-arch build (experimental using [buildx](https://github.com/docker/buildx)):

```
docker buildx create --use
docker buildx build --platform linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64,linux/386,linux/ppc64le --tag appwrite/clamav:0.0.0 --push .
```

## Find Us

- [GitHub](https://github.com/appwrite)
- [Discord](https://appwrite.io/discord)
- [Twitter](https://twitter.com/appwrite_io)

## Copyright and license

The MIT License (MIT) [http://www.opensource.org/licenses/mit-license.php](http://www.opensource.org/licenses/mit-license.php)
