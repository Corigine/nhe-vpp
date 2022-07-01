#set Current folder path
CUR_PATH=$(cd `dirname $0`;pwd)

cd $CUR_PATH/
#1.apt install vpp run Dependent Library
cd dependent-library/
dpkg -i libnl-route-3-200_3.4.0-1_amd64.deb 
dpkg -i libmbedcrypto3_2.16.4-1ubuntu2_amd64.deb
dpkg -i libmbedx509-0_2.16.4-1ubuntu2_amd64.deb
dpkg -i libmbedtls12_2.16.4-1ubuntu2_amd64.deb

cd ..
#2.dpkg install vpp deb
dpkg -i *.deb

