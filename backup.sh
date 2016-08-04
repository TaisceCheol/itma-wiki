#!/bin/bash
/bin/date -u
echo
echo 'Copying from container to DO host...'
/usr/bin/docker cp dockerconfluence_confluence_1:/var/atlassian/confluence/backups/ /root/
echo 'Syncing backup to aws s3'
cd /root/backups
/usr/bin/aws s3 sync . s3://itma.backd.wiki 
cd .. 
echo 'Cleaning backup folders...'
rm /root/backups/*.zip
/usr/bin/docker exec -it dockerconfluence_confluence_1 rm backups/*.zip
echo 'Backup complete'
echo
/bin/date -u
