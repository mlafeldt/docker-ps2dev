# A Docker Image for PS2 Development

[![](https://images.microbadger.com/badges/image/mlafeldt/ps2dev.svg)](https://microbadger.com/images/mlafeldt/ps2dev)

Cross-compile your PS2 projects inside a Docker container based on
[ps2toolchain](https://github.com/ps2dev/ps2toolchain).

## Quick Start

Run this command in your project's root folder to build it inside a Docker
container:

```bash
docker run -it --rm -v "$PWD:/src" mlafeldt/ps2dev make
```

This will mount the current folder to `/src` in the container and then run
`make` inside `/src`. You may execute other commands, of course.

There's also a "2011" tag for projects depending on a PS2SDK version from that
year:

```bash
docker run -it --rm -v "$PWD:/src" mlafeldt/ps2dev:2011 make
```

## Continuous Integration

With the Docker image in hand, you can also build and test your PS2 applications
on CI platforms. Here's an example configuration for Travis CI:

```yaml
# .travis.yml
language: c

sudo: required

services:
  - docker

script: docker run -it --rm -v "$PWD:/src" mlafeldt/ps2dev make test
```

## Author

This project is being developed by [Mathias Lafeldt](https://twitter.com/mlafeldt).

Some years ago I already created a [Vagrant Box for PS2 development](https://mlafeldt.github.io/blog/building-a-vagrant-box-for-ps2-development/).
