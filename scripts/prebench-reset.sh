#!/bin/bash

set -eu

SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd ${SCRIPT_DIR}
source ./env.sh

echo "config deploy"
bash ./config-deploy.sh 

cd ${SCRIPT_DIR}
echo "reset mysql"
sudo rm -f ${MYSQL_SLOW_LOG}
sudo systemctl restart mysql.service

echo "reset nginx"
sudo rm -f ${ACCESS_LOG}
sudo systemctl restart nginx.service

echo "build and reset app"
cd ${SCRIPT_DIR}
cd ../webapps/go
go build
sudo systemctl restart ${DEFAULT_APPLICATION_SERVICE}


echo "prebench setting is done"
