#!/bin/bash
echo "Installing curl ..."
sudo apt-get install curl -y

which docker

if [ $? -eq 1 ]
then
	echo "Installing Docker"
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	sudo apt-get update
	sudo apt-cache policy docker-ce
	sudo apt-get install -y docker-ce
	sudo systemctl status docker
fi

which docker-compose
if [ $? -eq 1 ]
then
	echo "Installing Docker Compose"
	sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	docker-compose --version
fi

cd ~
curl -O https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
tar xvf go1.6.linux-amd64.tar.gz
sudo chown -R root:root ./go
sudo mv go /usr/local

echo "Setting Go Path"
echo "export GOROOT=$HOME/go" >> ~/.profile
export GOROOT=$HOME/go
echo "export GOPATH=$HOME/work" >> ~/.profile
export GOPATH=$HOME/work
echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> ~/.profile
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin

echo "Installing Node.js 8.x. 9.x not supported"
curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install nodejs -y
sudo apt-get install build-essential -y
sudo apt-get install python -y
echo "Done."
