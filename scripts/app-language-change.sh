#!/bin/bash

sudo systemctl stop r-isucon-node.service
sudo systemctl disable r-isucon-node.service

sudo systemctl enable r-isucon-go.service
sudo systemctl start r-isucon-go.service
