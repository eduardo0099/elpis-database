DBNAME='dbsw'
export MYSQL_PWD='kairosdb'
FILENAME=$DBNAME'_'$(date '+%m%d_%H%M').sql
mkdir -p ../backups
mysqldump -uroot $DBNAME > ../backups/$FILENAME
echo 'backup created ../backups/'$FILENAME
