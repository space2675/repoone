#!/bin/sh

# The name of this script
SCRIPT_NAME=test.sh

###################################################################
#
# Check for Invalid Command Line Arguments
# $1 = ORACLE_SID
#
###################################################################
if [ $# -lt 1 ]
then
  echo "Usage: $SCRIPT_NAME <ORACLE_SID>"
  echo "Example: $SCRIPT_NAME DWHSE PROD"
  exit
fi

###################################################################
#
# Setup Script Variables
#
###################################################################
#This is the oracle_sid of the instance that the oracle environment
#will be setup for.
export ORACLE_SID=$1

#
# Initially we need some oracle path in the PATH for the dbhome command
# to be found. We reset the PATH variable to the proper oracle_home/bin
# below
#
export ORACLE_HOME=/usr/local/banner/oracle/product/current
export PATH=$ORACLE_HOME/bin:/usr/local/bin:$PATH

export ORAENV_ASK=NO

. /usr/local/bin/oraenv

export ORAENV_ASK=YES

echo "Starting Create PIN for ORACLE_SID: $ORACLE_SID"

###################################################################
#
# Run our SQL Plus Commands
#
###################################################################
sqlplus system/manager <<ENDOFSQL
whenever sqlerror exit sql.sqlcode;
select sysdate from dual;
exit;
ENDOFSQL

ERRORCODE=$?

#Check the return code from SQL Plus
if [ $ERRORCODE != 0 ]
then
  echo "********************"
  echo "ERROR: The SQL Plus Command Failed. ErrorCode: $ERRORCODE"
else
  echo "********************"
  echo "SQL Plus Successfully Ran. ErrorCode: $ERRORCODE"
fi

