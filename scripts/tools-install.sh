#!/bin/bash

set -eu

echo "kataribe install"
go get -u github.com/matsuu/kataribe

echo "querydigest install"
go get -u github.com/akito0107/querydigest/cmd/querydigest

echo  "pprof install"
go get -u github.com/google/pprof

echo "graphviz install"
sudo apt install -y --no-install-recommends graphviz graphviz-dev

