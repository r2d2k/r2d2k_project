#!/bin/sh

packer validate -var-file=yandex.pkrvars.hcl ubuntu.pkr.hcl
