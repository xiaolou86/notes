for vif_uuid in `xe vif-list  | grep ^uuid | awk '{print $NF}'`
do
	vm_uuid=`xe vif-param-list uuid=$vif_uuid | grep vm-uuid | awk '{print $NF}'`
	vm_ip=`xe vm-param-list uuid=$vm_uuid | grep '0/ip' | awk '{print $4}' | awk -F\; '{print $1}'`

	xe vif-param-list uuid=$vif_uuid | egrep 'vm-name-label|MAC ' | awk '{print $4}' | xargs echo -n >> r.out
	echo " $vm_uuid $vm_ip" >> r.out
done
