set -eu

if [ $# -gt 0 ]; then
    MYSQL_SETTING_FILE=$1
else
    MYSQL_SETTING_FILE=/etc/mysql/mysql.conf.d/mysqld.cnf
fi

echo "copy backup mysql setting"
cp $MYSQL_SETTING_FILE ~/copy_$(basename $MYSQL_SETTING_FILE)

echo "slow query setting"
cat <<EOF >> $MYSQL_SETTING_FILE
# Here you can see queries with especially long duration
slow_query_log         = 1
slow_query_log_file    = /tmp/slow.log
long_query_time        = 0
EOF

echo "restart mysql service"
sudo systemctl restart mysql.service
