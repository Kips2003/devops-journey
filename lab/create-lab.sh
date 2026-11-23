#!/usr/bin/env bash
# Creates lab-1..3 (Ubuntu 24.04, 2 CPU / 4 GB / 25 GB) on KVM with fixed IPs .11-.13
set -euo pipefail
cd "$(dirname "$0")"
for i in 1 2 3; do
  printf "instance-id: lab-$i\nlocal-hostname: lab-$i\n" > meta-data-$i
  sudo virsh net-update default add ip-dhcp-host \
    "<host mac='52:54:00:00:00:1$i' name='lab-$i' ip='192.168.122.1$i'/>" --live --config
  sudo virt-install --name lab-$i --memory 4096 --vcpus 2 \
    --disk pool=lab,size=25,backing_store=/home/vms/noble.img \
    --import --os-variant ubuntu24.04 \
    --network network=default,mac=52:54:00:00:00:1$i \
    --cloud-init user-data=user-data,meta-data=meta-data-$i \
    --noautoconsole
done
