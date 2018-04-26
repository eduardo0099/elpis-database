DBNAME='elpis'
FILENAME=$DBNAME'_'$(date '+%m%d_%H%M').sql
mkdir -p ../backups
mysqldump -uroot -pmysql $DBNAME > ../backups/$FILENAME

