#! /bin/bash

function backup_pg() {
   ARCHIVE=$1
   echo Backing up database ...
   psql -U postgres -h localhost -c "SELECT pg_start_backup('$ARCHIVE');" tutdb
   tar czf $ARCHIVE $SRC
   psql -U postgres -h localhost -c "SELECT pg_stop_backup();" tutdb
   echo Completed!
}

SRC=/var/lib/pgsql/11/data
DST=/tmp/tempfile/pg/Wals/

TODAY=`date +%F`
ARCHIVE=tutdb-backup-$TODAY.tgz
BAKDIR=Archive-$TODAY

mkdir -p $DST
cd $DST/$BACKDIR

backup_pg $ARCHIVE
