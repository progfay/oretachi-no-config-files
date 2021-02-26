#!/bin/bash

set -eu

SSH_KEY_PATH="~/.ssh/id_rsa"
SSH_DESTINATION="XXX.XXX.XXX.XXX"
DIST_PATH="../.info/oretata-2"

function exec_ssh() {
        ssh -i $SSH_KEY_PATH $SSH_DESTINATION $@
}

mkdir -p $DIST_PATH
exec_ssh "cat /proc/cpuinfo" > $DIST_PATH/cpuinfo
exec_ssh "cat /proc/meminfo" > $DIST_PATH/meminfo
exec_ssh "cat /proc/version" > $DIST_PATH/version
exec_ssh "cat /proc/swaps" > $DIST_PATH/swaps
exec_ssh "df -h" > $DIST_PATH/df
