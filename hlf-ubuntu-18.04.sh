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
