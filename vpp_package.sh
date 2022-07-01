#set Current folder path
CUR_PATH=$(cd `dirname $0`;pwd)

cd $CUR_PATH/
cd ..
#1.update vpp code
git submodule update --remote

cd $CUR_PATH/
#2.clear *.deb file before
rm -rf build-root/*.deb

#3.clear vpp lib and make build new vpp-lib
apt-get remove --purge "vpp*" -y

#4.vpp make build opt
groupadd -f -r vpp
make wipe 
echo "Y" | make install-dep 
make install-ext-dep

#5.make dpdk debug
cd build/external/
make clean config install
cp -r _install/* /opt/vpp/external/x86_64/

#6.make vpp debug
cd -
make build pkg-deb-debug

cd ..
#7.package all .deb file
pkt_name="nhe_c_vpp_2202"
mkdir $pkt_name
chmod 777 $pkt_name
cp nhe-vpp/build-root/*.deb $pkt_name/
chmod 777 $pkt_name/*.deb

#8.package dpdk-devbind.py
cp nhe-vpp/dpdk-devbind.py  $pkt_name/

#9.package binding_dpdk.sh
cp nhe-vpp/binding_dpdk.sh  $pkt_name/

#10.package vpp_install.sh
cp nhe-vpp/vpp_install.sh $pkt_name/

#11.package vpp dependent library
cd $pkt_name/
mkdir dependent-library
chmod 777 dependent-library
cd ..
cp nhe-vpp/dependent-library/libmbedcrypto3_2.16.4-1ubuntu2_amd64.deb $pkt_name/dependent-library/
cp nhe-vpp/dependent-library/libmbedtls12_2.16.4-1ubuntu2_amd64.deb $pkt_name/dependent-library/
cp nhe-vpp/dependent-library/libmbedx509-0_2.16.4-1ubuntu2_amd64.deb $pkt_name/dependent-library/
cp nhe-vpp/dependent-library/libnl-route-3-200_3.4.0-1_amd64.deb $pkt_name/dependent-library/

#12.tar vpp run deb package
tar -zcvf $pkt_name.tar.gz ./$pkt_name/
chmod 777 $pkt_name.tar.gz

rm -rf $pkt_name/
