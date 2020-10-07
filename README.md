# libvirt-c-clion-remote-dev

yum -y install  libvirt-devel


rpm -ql libvirt-devel  | grep libvirt.so

/usr/lib64/libvirt.so



yum install centos-release-scl-rh

yum install devtoolset-8-gdb

cp /opt/rh/devtoolset-8/root/bin/gdb /usr/bin/



yum install -y gcc g++ gcc-c++ make automake texinfo wget


yum -y install cmake-2.8.12.2-2.el7



gdb --version
GNU gdb (GDB) Red Hat Enterprise Linux 8.2-3.el7


toolchain   remote

cmake  toolchain  remot host


运行调试配置 

CMake Application


