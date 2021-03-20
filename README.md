# deatheibon/keeweb-webdav

Dockerized Best-Effort Extent-Same btrfs deduplication agent.
https://github.com/Zygo/bees

This image is based on Alpine Linux with bees agent from testing repositories. 

## Usage

Mount BTRFS root subvolume to /mnt for example like: 

mount /dev/"device" /mnt -o subol=/

adjust the docker-compose volumes section. 

## docker run

### daemonized
docker run -d --privileged -e HASHTABLE="/mnt/.beeshome/beeshash.dat" -e HASH_TABLE_SIZE="4g" -e OPTIONS=-a -v /mnt:/mnt deatheibon/bees

### interactive
docker run -ti --privileged -e HASHTABLE="/mnt/.beeshome/beeshash.dat" -e HASH_TABLE_SIZE="4g" -e OPTIONS=-a -v /mnt:/mnt deatheibon/bees

## docker-compose
```version: '3.3'
services:
  beesd:
    container_name: beesd
    privileged: true
    restart: unless-stopped
    hostname: beesd
    build:
      context: .
    environment:
      - TZ=Europe/Berlin
      - HASHTABLE="/mnt/.beeshome/beeshash.dat"
      - HASH_TABLE_SIZE="4g"
      - OPTIONS=-a
    volumes:
      - /mnt:/mnt
```
