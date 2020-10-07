# Docker ClamAV

[![Build Status](https://travis-ci.com/appwrite/docker-clamav.svg?branch=master)](https://travis-ci.com/appwrite/docker-clamav)
[![Discord](https://img.shields.io/discord/564160730845151244?label=discord)](https://discord.gg/GSeTUeA)
[![Docker Pulls](https://badgen.net/docker/pulls/appwrite/clamav)](https://travis-ci.org/appwrite/clamav)

A ClamAV docker image with auto database updates by the [Appwrite team](https://github.com/appwrite). Use this image and a compilable client library to connect to the ClamAV using a TCP connection.

## Getting Started

These instructions will cover usage information to help your run ClamAV docker image 

### Prerequisities

In order to run this image you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

### Usage

```shell
docker run appwrite/clamav
```

#### Environment Variables

This image has no environment variables. 

#### Volumes

You can mount any volume you need to allow the image to scan its files. 

### Build

```
docker build --tag appwrite/clamav:0.0.0 .
```

``
docker push appwrite/clamav:0.0.0
``

## Find Us

* [GitHub](https://github.com/appwrite)
* [Discord](https://discord.gg/GSeTUeA)
* [Twitter](https://twitter.com/appwrite_io)

## Authors

**Eldad Fux**

+ [https://twitter.com/eldadfux](https://twitter.com/eldadfux)
+ [https://github.com/eldadfux](https://github.com/eldadfux)

## Copyright and license

The MIT License (MIT) [http://www.opensource.org/licenses/mit-license.php](http://www.opensource.org/licenses/mit-license.php)
