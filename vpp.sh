#set Current folder path
CUR_PATH=$(cd `dirname $0`;pwd)

cd $CUR_PATH/

#1.init vpp 
./vpp_init.sh

#2.package vpp deb
./vpp_package.sh

