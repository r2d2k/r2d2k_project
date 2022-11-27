#!/bin/sh

yc vpc subnet  delete --name packer
yc vpc network delete --name packer
