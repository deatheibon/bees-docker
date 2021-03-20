# deatheibon/keeweb-webdav

Dockerized Best-Effort Extent-Same btrfs deduplication agent.
https://github.com/Zygo/bees

This image is based on Alpine Linux with bees agent from testing repositories. 

# Usage

# docker-compose
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
      - HASH_TABLE:/home/bees

volumes:
  HASH_TABLE:
```
