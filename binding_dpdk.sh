modprobe vfio-pci
chmod a+x /dev/vfio
chmod 0666 /dev/vfio/*
echo Y | sudo tee /sys/module/vfio/parameters/enable_unsafe_noiommu_mode
mount -t hugetlbfs none /dev/hugepages/

#dpdk binding
#Must check interface-name and pci-number of local device
#ifconfig ens34 down
#./dpdk-devbind.py --bind=vfio-pci 02:02.0
#ifconfig ens35 down
#./dpdk-devbind.py --bind=vfio-pci 02:03.0
#ifconfig ens36 down
#./dpdk-devbind.py --bind=vfio-pci 02:04.0
#ifconfig ens40 down
#./dpdk-devbind.py --bind=vfio-pci 02:08.0

#dpdk binding check
./dpdk-devbind.py --status

