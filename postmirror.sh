#!/bin/sh -e

bash /var/spool/apt-mirror/var/clean.sh

# If you get hash mismatches, the following lines will sync each already-downloaded file (this is a long operation)
#rsync -rcvv --stats --times --existing rsync://fr.archive.ubuntu.com/ubuntu/pool/ /var/spool/apt-mirror/mirror/archive.ubuntu.com/ubuntu/pool/
#rsync -rcvv --stats --times --existing rsync://fr.archive.ubuntu.com/ubuntu/dists/ /var/spool/apt-mirror/mirror/archive.ubuntu.com/ubuntu/dists/

# Clean 0B files
find "/var/spool/apt-mirror/mirror/" -size 0 -exec rm -f {} \;
