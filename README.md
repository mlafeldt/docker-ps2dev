# A Docker Image for PS2 Development

[![](https://images.microbadger.com/badges/image/mlafeldt/ps2dev.svg)](https://microbadger.com/images/mlafeldt/ps2dev)

Use it to cross-compile your PS2 projects like this:

```bash
cd $PROJECT
docker run -it --rm -v "$PWD:/src" mlafeldt/ps2dev make
```
