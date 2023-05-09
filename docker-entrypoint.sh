#!/bin/sh
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
mount /dev/mapper/$CACHEDEV /mnt -o subvol=/
if [ ! -f ${HASH_TABLE} ]; then
	mkdir /mnt/.beeshome
	truncate -s ${HASH_TABLE_SIZE} ${HASH_TABLE}
	chmod 700 ${HASH_TABLE}
fi
bees --no-timestamps ${OPTIONS} /mnt