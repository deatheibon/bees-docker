#!/bin/sh
# Trigger an error if non-zero exit code is encountered
set -e 
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
mount /dev/mapper/$CACHEDEV /mnt -o subvol=/
if [ ! -f ${HASH_TABLE} ]; then
	mkdir -p /mnt/.beeshome
	truncate -s ${HASH_TABLE_SIZE} ${HASH_TABLE}
	chmod 700 ${HASH_TABLE}
fi
exec /bin/bees --no-timestamps ${OPTIONS} /mnt 2>&1
