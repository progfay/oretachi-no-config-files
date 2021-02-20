#!/bin/bash
set -eu

cd $(dirname $0)
source env.sh

sudo systemctl stop ${DISABLE_APPLICATION_SERVICE}
sudo systemctl disable ${DISABLE_APPLICATION_SERVICE}

sudo systemctl enable ${DEFAULT_APPLICATION_SERVICE}
sudo systemctl start ${DEFAULT_APPLICATION_SERVICE}
