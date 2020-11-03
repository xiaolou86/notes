#!/bin/bash

if [ "x$1" != "xtrue"  -a "x$1" != "xfalse" ]; then
	echo "Usage: bash $0 [true|false]"
	exit 1
fi

auto_revert=$1

for vm_uuid in `xe vm-list power-state=running is-control-domain=false | grep uuid | awk '{print $5}'`
do
	echo "xe vm-param-set uuid=$vm_uuid other-config:vdi-vm-auto-revert=$auto_revert"
	xe vm-param-set uuid=$vm_uuid other-config:vdi-vm-auto-revert=$auto_revert
done
