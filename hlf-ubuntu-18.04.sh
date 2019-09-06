#!/bin/bash

#get curl source
wget https://curl.haxx.se/download/curl-7.65.3.tar.gz

#install zlib
wget https://www.zlib.net/zlib-1.2.11.tar.gz
tar -xvf zlib-1.2.11.tar.gz
cd zlib-1.2.11
./configure
sudo make
sudo make install
cd..

sudo apt-get install make libtool libssl-dev -y
tar -xvf curl-7.65.3.tar.gz
cd curl-7.65.3
sudo ./buildconf
sudo .configure --wish-ssl --with-zlib
sudo make
sudo make install

#remove any old versions of docker
sudo apt-get remove docker docker-engine docker.io containerd runc

#install depts for docker
sudo apt-get install apt-transport-https ca-certificates gnupg-agent software-properties-common

#add docker gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#add stable repo
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
   
  sudo apt-get update
  
  sudo apt-get install docker-ce docker-ce-cli containerd.io -y
  #todo: add user executing this script to docker user group to prevent sudo requirement
