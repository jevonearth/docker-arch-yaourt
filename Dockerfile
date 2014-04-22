#
# Dockerfile for Arch with yaourt installed
FROM base/arch
MAINTAINER Jev Bjorsell, @jevonearth

RUN pacman --quiet --noconfirm -S base-devel
RUN pacman --quiet --noconfirm -S yajl


WORKDIR /tmp/scratch
RUN curl https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz | tar zx
WORKDIR /tmp/scratch/package-query
RUN makepkg --asroot --noconfirm -i


WORKDIR /tmp/scratch
RUN curl https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz | tar zx
WORKDIR /tmp/scratch/yaourt
RUN makepkg --asroot --noconfirm -i
