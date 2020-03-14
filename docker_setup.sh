#!/bin/bash

# Running install
sudo apt-get update
sudo apt-get install -y htop curl libssl-dev libpython-dev libpython3-dev libjpeg-dev git
sudo curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo /usr/bin/python3.5 get-pip.py
sudo /usr/bin/python3.5 -m pip install --upgrade --user virtualenv
sudo pip3 install h5py tensorflow Pillow
