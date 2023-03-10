#!/bin/bash
sudo yum -y install git gcc pciutils

mkdir -p /home/vagrant/dev
cd /home/vagrant/dev
#remove in case already exists (if rerunning the script)
rm -Rf /home/vagrant/dev/cns-sfnettest
git clone https://github.com/Xilinx-CNS/cns-sfnettest
cd cns-sfnettest/src
make

#copy sfnt-pingpong and sfnt-stream applications to ~/bin which is already on the path by default
mkdir -p /home/vagrant/bin
cp /home/vagrant/dev/cns-sfnettest/src/sfnt-pingpong /home/vagrant/bin
cp /home/vagrant/dev/cns-sfnettest/src/sfnt-stream /home/vagrant/bin

chown -R vagrant:vagrant /home/vagrant/dev

echo "Finished building sfnettest"
sudo yum install git -y
sudo yum install curl -y
# curl https://sh.rustup.rs -sSf | sh -s -- -y
sudo -u vagrant -i bash -c 'curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y'
source $HOME/.cargo/env
sudo yum -y install gcc
sudo -u vagrant -i rustup default nightly

#git clone https://gitlab.engr.illinois.edu/ie598_high_frequency_trading_spring_2022/ie498_hft_spring_2022_group_05/group_05_project.git
