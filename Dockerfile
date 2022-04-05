FROM ubuntu:21.04
ARG DEBIAN_FRONTEND=noninteractive

ADD docker-entrypoint.sh /
RUN apt update -y && apt -y install build-essential btrfs-progs markdown tzdata git gcc pkg-config systemd
RUN git clone https://github.com/Zygo/bees.git /usr/src/bees
RUN cd /usr/src/bees && make
RUN cp /usr/src/bees/bin/bees /bin/bees
RUN rm -rf /usr/src/bees

ENTRYPOINT ["/docker-entrypoint.sh"]
