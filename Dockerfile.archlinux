FROM archlinux:latest
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Rome
ENV HASH_TABLE=/mnt/.beeshome/beeshash.dat
ENV HASH_TABLE_SIZE=4G
ENV OPTIONS=-a\ -c\ 1
ENV CACHEDEV=cachedev_1

ADD docker-entrypoint.sh /

RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm base-devel btrfs-progs markdown tzdata git gcc pkg-config systemd && \
    git clone https://github.com/Zygo/bees.git /usr/src/bees && \
    cd /usr/src/bees && \
    make && \
    cp /usr/src/bees/bin/bees /bin/bees && \
    rm -rf /usr/src/bees

ENTRYPOINT ["/docker-entrypoint.sh"]
