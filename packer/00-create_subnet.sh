#!/bin/sh

yc vpc network create --name packer > /dev/null
yc vpc subnet  create --name packer --range 10.0.0.0/24 --network-name packer --zone ru-central1-a
