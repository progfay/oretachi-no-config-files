#!/bin/bash

set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd ${SCRIPT_DIR}
source env.sh

sudo cp ../configs/nginx/nginx.conf ${NGINX_CONF_PATH}

sudo cp ../configs/mysql/mysql.conf.d/mysqld.cnf ${MYSQL_CONF_PATH}
