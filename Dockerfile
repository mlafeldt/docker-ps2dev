FROM ubuntu:12.04

MAINTAINER Mathias Lafeldt <mathias.lafeldt@gmail.com>

ENV TOOLCHAIN_VERSION ae6f9c003c98470040e78cec739ea86a49de2a39
ENV PS2SDK_VERSION    fd7276d3e1b4605da5b6c494f5759cce248c6f38

ENV PS2DEV /ps2dev
ENV PS2SDK $PS2DEV/ps2sdk
ENV PATH   $PATH:$PS2DEV/bin:$PS2DEV/ee/bin:$PS2DEV/iop/bin:$PS2DEV/dvp/bin:$PS2SDK/bin

ENV DEBIAN_FRONTEND noninteractive

COPY scripts /scripts

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y autoconf bzip2 gcc git make patch wget \
    && git clone git://github.com/ps2dev/ps2toolchain.git /toolchain \
    && cd /toolchain \
    && git checkout -qf $TOOLCHAIN_VERSION \
    && cp -av /scripts/* scripts/ \
    && ./toolchain.sh \
    && rm -rf /toolchain /var/lib/apt/lists/*

WORKDIR /src
CMD ["/bin/bash"]
