#!/bin/bash
set -eu
MYSQL_SLOW_LOG
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd ${SCRIPT_DIR}
source env.sh

sudo chmod 775 $MYSQL_SLOW_LOG
querydigest -f $MYSQL_SLOW_LOG
