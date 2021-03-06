#!/bin/bash

set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd ${SCRIPT_DIR}
source env.sh

sudo cp ${NGINX_CONF_PATH} ${NGINX_CONF_PATH}.origin
cp ${NGINX_CONF_PATH} ../configs/nginx/nginx.conf

sudo cp ${MYSQL_CONF_PATH} ${MYSQL_CONF_PATH}.origin
cp ${MYSQL_CONF_PATH} ../configs/mysql/mysql.conf.d/mysqld.cnf

cd ${SCRIPT_DIR}
echo "access log setting (you should manualy set to ../configs/nginx/nginx.conf)"

cat ../configs/nginx/accesslog.md

cd ${SCRIPT_DIR}
echo "slow query setting (this is automaticaly set to ../configs/mysql/mysql.conf.d/mysqld.cnf"
cat <<EOF >> ../configs/mysql/mysql.conf.d/mysqld.cnf
# Here you can see queries with especially long duration
slow_query_log         = 1
slow_query_log_file    = ${MYSQL_SLOW_LOG}
long_query_time        = 0
EOF
