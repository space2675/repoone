#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 [success|failure]" >&2
    exit 1
fi

jobstatus=$1
sqlplus "dev_os/pass@localhost:1521/XE" <<ENDOFSQL
whenever sqlerror exit sql.sqlcode;
update job_status set end_date = sysdate, status='$jobstatus' where name='task1'; 
exit;
ENDOFSQL
