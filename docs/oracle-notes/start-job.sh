#!/bin/sh

sqlplus "dev_os/pass@localhost:1521/XE" <<ENDOFSQL
whenever sqlerror exit sql.sqlcode;
update job_status set start_date = sysdate where name='task1'; 
exit;
ENDOFSQL
