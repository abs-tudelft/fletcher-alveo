FROM centos:7.6.1810

RUN yum install -y \
      gcc \
      git \
      glibc-devel \
      iproute \
      kernel-devel \
      make \
      numactl-devel \
      patch \
      pciutils \
      which && \
    yum clean all && \
    rm -rf /var/cache/yum

ADD dpdk /dpdk
ADD dma_ip_drivers/QDMA/DPDK /dpdk
ADD patches /patches
WORKDIR /patches
RUN patch /dpdk/config/common_base config/common_base.patch && \
    patch /dpdk/drivers/net/Makefile drivers/net/Makefile.patch && \
    patch /dpdk/mk/rte.app.mk mk/rte.app.mk.patch && \
    patch /dpdk/mk/rte.cpuflags.mk mk/rte.cpuflags.mk.patch && \
    patch /dpdk/usertools/dpdk-devbind.py usertools/dpdk-devbind.py.patch

WORKDIR /dpdk
ENV RTE_SDK /dpdk
ENV RTE_TARGET x86_64-native-linuxapp-gcc
RUN export KERNEL_VERSION=`ls /usr/src/kernels/` && \
    make config RTE_KERNELDIR=/usr/src/kernels/$KERNEL_VERSION T=$RTE_TARGET install

SHELL ["/bin/bash", "-c"]
ENTRYPOINT mkdir -p /mnt/huge && \
           mount -t hugetlbfs nodev /mnt/huge && \
           modprobe uio && \
           lsmod | grep -q igb_uio || insmod $RTE_SDK/$RTE_TARGET/kmod/igb_uio.ko && \
           export PCI_DEV=`lspci -D | grep 903f | awk '{print $1;}'` && \
           export PCI_DEV_SHORT=`lspci | grep 903f | awk '{print $1;}'` && \
           /dpdk/usertools/dpdk-devbind.py -b igb_uio $PCI_DEV_SHORT && \
           # echo 'igb_uio' > /sys/bus/pci/devices/$PCI_DEV/driver_override && \
           # echo $PCI_DEV >> /sys/bus/pci/drivers/igb_uio/bind && \
           bash ; \
           /dpdk/usertools/dpdk-devbind.py -u $PCI_DEV_SHORT
           # echo $PCI_DEV >> /sys/bus/pci/drivers/igb_uio/unbind
