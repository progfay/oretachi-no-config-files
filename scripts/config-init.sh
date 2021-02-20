#!/bin/bash

set -eu

cd $(dirname $0)
source env.sh

sudo cp ${NGINX_CONF_PATH} ${NGINX_CONF_PATH}.origin
cp ${NGINX_CONF_PATH} ../configs/nginx/nginx.conf

sudo cp ${MYSQL_CONF_PATH} ${MYSQL_CONF_PATH}.origin
cp ${MYSQL_CONF_PATH} ../configs/mysql/mysql.conf.d/mysqld.cnf

cd $(dirname $0)
echo "access log setting (you should manualy set to ../configs/nginx/nginx.conf)"
cat <<EOF
log_format with_time '$remote_addr - $remote_user [$time_local] '
                     '"$request" $status $body_bytes_sent '
                     '"$http_referer" "$http_user_agent" $request_time';
access_log /var/log/nginx/access.log with_time;
EOF


cd $(dirname $0)
echo "slow query setting (this is automaticaly set to ../configs/mysql/mysql.conf.d/mysqld.cnf"
cat <<EOF >> ../configs/mysql/mysql.conf.d/mysqld.cnf
# Here you can see queries with especially long duration
slow_query_log         = 1
slow_query_log_file    = /tmp/slow.log
long_query_time        = 0
EOF
