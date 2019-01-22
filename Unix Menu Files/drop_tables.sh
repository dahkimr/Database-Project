#!/bin/sh
export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "d98kim/04096715@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

DROP TABLE msupply;
DROP TABLE bsupply;
DROP TABLE bborrow;
DROP TABLE mborrow;
DROP TABLE bhold;
DROP TABLE mhold;
DROP TABLE bcopy;
DROP TABLE mcopy;
DROP TABLE book;
DROP TABLE movie;
DROP TABLE supplier;
DROP TABLE member;
exit;
EOF
