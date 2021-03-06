#!/bin/bash

#install openshift client
yum install python-pip -y
pip install --trusted-host files.pythonhosted.org --trusted-host pypi.org --trusted-host pypi.python.org --upgrade pip
pip install --trusted-host files.pythonhosted.org --trusted-host pypi.org --trusted-host pypi.python.org --upgrade setuptools
pip install --trusted-host files.pythonhosted.org --trusted-host pypi.org --trusted-host pypi.python.org --ignore-installed ipaddress openshift

#setup GoLang Environment
yum install go -y
echo "export GOPATH=$HOME/tutorial/go" >> ~/.bashrc
echo "export GOBIN=$GOPATH/bin" >> ~/.bashrc && mkdir -p $GOPATH/bin
echo "export GOROOT=/usr/lib/golang" >> ~/.bashrc
echo "export PATH=$PATH:$GOPATH/bin" >> ~/.bashrc
. ~/.bashrc

#install dep
curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

#install Operator sdk
mkdir -p $GOPATH/src/github.com/operator-framework
cd $GOPATH/src/github.com/operator-framework
git clone https://github.com/operator-framework/operator-sdk
cd operator-sdk
git checkout master
make dep
make install
