#!/bin/bash

set -eu

cd $(dirname $0)
source env.sh

sudo cp ../configs/nginx/nginx.conf $NGINX_CONF_PATH

sudo cp ../configs/mysql/mysql.conf.d/mysqld.cnf $MYSQL_CONF_PATH
