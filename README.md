# A Docker Image for PS2 Development

[![](https://images.microbadger.com/badges/image/mlafeldt/ps2dev.svg)](https://microbadger.com/images/mlafeldt/ps2dev)

Based on [ps2toolchain](https://github.com/ps2dev/ps2toolchain).

Use it to cross-compile your PS2 projects inside a Docker container like this:

```bash
cd $PROJECT
docker run -it --rm -v "$PWD:/src" mlafeldt/ps2dev make
```

(This will mount the current folder to `/src` in the container and then run `make` inside `/src`.)

There's also a "2011" tag for projects depending on a PS2SDK version from that year:

```bash
docker run -it --rm -v "$PWD:/src" mlafeldt/ps2dev:2011 make
```

## Author

This project is being developed by [Mathias Lafeldt](https://twitter.com/mlafeldt).

Some years ago, I also created a [Vagrant Box for PS2 development](https://mlafeldt.github.io/blog/building-a-vagrant-box-for-ps2-development/).
