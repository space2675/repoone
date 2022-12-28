#!/bin/sh
sqlplus "dev_os/pass@localhost:1521/XE" <<ENDOFSQL
whenever sqlerror exit sql.sqlcode;
select sysdate from dual;
exit;
ENDOFSQL
