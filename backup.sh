
#!/bin/bash
# very simple Backupscript for Cronjob Task based on: https://wiki.ubuntuusers.de/Skripte/Backupscript/
DATE=$(date +%Y-%m-%d-%H%M%S)
mkdir /backup/auto-speedtest/
BACKUP_DIR="/backup/auto-speedtest"
SOURCE="~/auto-speedtest"

tar cjpf $BACKUP_DIR/backup-$DATE.tar.bz2 $SOURCE
scp -C2 -P 22 -i ~/.ssh/id_rsa.pub /backup/auto-speedtest/* user@hostname:/backupdir/
