#!/bin/bash

set -eu

cd $(dirname $0)
source ./env.sh

echo "config deploy"
sh ./config-deploy.sh 

cd $(dirname $0)
echo "reset mysql"
sudo rm -f ${MYSQL_SLOW_LOG}
sudo systemctl restart mysql.service

echo "reset nginx"
sudo rm -f ${ACCESS_LOG}
sudo systemctl restart nginx.service

echo "build and reset app"
cd $(dirname $0)
cd ../webapps/go
go build
sudo systemctl restart ${DEFAULT_APPLICATION_SERVICE}


echo "prebench setting is done"
