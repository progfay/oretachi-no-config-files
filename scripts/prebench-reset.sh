#!/bin/bash

set -eu

cd $(dirname $0)
echo "config deploy"
sh ./config-deploy.sh 

cd $(dirname $0)
echo "reset mysql"
sudo rm -f /tmp/slow.log
sudo systemctl restart mysql.service

echo "reset nginx"
sudo rm -f /var/log/nginx/access.log
sudo systemctl restart nginx.service

echo "build and reset app"
cd $(dirname $0)
cd ../webapps/go
go build
sudo systemctl restart r-isucon-go.service


echo "prebench setting is done"
