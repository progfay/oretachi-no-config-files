#!/bin/bash

export NGINX_CONF_PATH="/etc/nginx/nginx.conf"
export MYSQL_CONF_PATH="/etc/mysql/mysql.conf.d/mysqld.cnf"
export ACCESS_LOG="/var/log/nginx/access.log"
export MYSQL_SLOW_LOG="/tmp/slow.log"

export DEFAULT_APPLICATION_SERVICE="r-isucon-go.service"
export DISABLE_APPLICATION_SERVICE="r-isucon-node.service"
