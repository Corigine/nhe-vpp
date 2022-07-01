#set Current folder path
CUR_PATH=$(cd `dirname $0`;pwd)

#1.apt install vpp Dependent Library
apt-get update
apt-get install -y make rpm vim python-cffi python-pycparser iproute2 libc-ares2 libudev-dev numactl wget

#2.vpp make install-dep
chmod 644 /usr/lib/sudo/sudoers.so
chown -R root /usr/lib/sudo

cd $CUR_PATH/

groupadd -f -r vpp
echo "Y" | make install-dep
make install-ext-dep

