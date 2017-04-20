host=cc1
db=project_b
dstdir=~/src/project_b/data

set -eux

ssh $host "mysqldump $db > /tmp/$db.mysql"
ssh $host "tar cjvf $dstdir/$db-$(date '+%Y-%m-%d').mysql.tar.bz2 -C /tmp $db.mysql"
ssh $host "rm -v /tmp/$db.mysql"
