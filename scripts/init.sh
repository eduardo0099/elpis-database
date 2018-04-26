DBNAME='dbsw'
export MYSQL_PWD='kairosdb'

mysqladmin -uroot -f drop $DBNAME
echo ''

exitcode=$?
if [ $exitcode -ne 0 ]; then exit 1; fi

echo "create database "$DBNAME | mysql -uroot 

echo 'creating tables...'
mysql -uroot $DBNAME < ../create.sql
echo 'done!'
echo ''

echo 'adding inserts...'
mysql -uroot $DBNAME < ../insert.sql

exitcode=$?
if [ $exitcode -ne 0 ]; then exit 1; fi
echo 'done!'
echo ''

echo 'adding procedures...'
mysql -uroot $DBNAME < ../procedure.sql

exitcode=$?
if [ $exitcode -ne 0 ]; then exit 1; fi
    
echo 'done!'
echo ''
echo $DBNAME' created'

