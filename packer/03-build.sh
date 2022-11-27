#!/bin/sh

packer build -var-file=yandex.pkrvars.hcl ubuntu.pkr.hcl
