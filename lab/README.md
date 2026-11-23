# Home lab

3 Ubuntu 24.04 VMs on KVM/libvirt (kips20, Ubuntu 24.04 host).

| VM | IP | CPU / RAM / Disk |
|----|----|------------------|
| lab-1 | 192.168.122.11 | 2 / 4 GB / 25 GB |
| lab-2 | 192.168.122.12 | 2 / 4 GB / 25 GB |
| lab-3 | 192.168.122.13 | 2 / 4 GB / 25 GB |

- Storage pool `lab` at `/home/vms`, base image `noble.img` (Ubuntu cloud image)
- `user-data`: cloud-init config (put your public key in)
- `create-lab.sh`: creates all 3 VMs
- Snapshot `clean-install` on each VM: `sudo virsh snapshot-revert lab-1 clean-install`
