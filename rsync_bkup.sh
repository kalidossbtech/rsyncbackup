#!/bin/bash
#Script author by Kalidass
set -x
DATE=`date`
# Backup using Rsync
rsync -rv root@ip_address:/sourcedir/ /Destination/dir/ > /logfile.log
if (($?)); then
{

	echo "$DATE  \ "This is error generated, when backing up the rsync data"\ " >> /var/log/backupmail.log
	mail -s "RSYNC BACKUP ERROR" user@domain.in,user@domain < /var/log/backupmail.log
#        exit;
}
else 
{
        tail /var/log/backupmail.log > /var/log/RD.txt && mail -s "RSYNC BACKUP is successfull($DATE)" user@domain.in < /var/log/RD.txt
#       tail backupmail.log > RD.txt && mail -s "Test Mail" user@domain.in < /var/log/RD.txt
}
fi
