#!/bin/bash
# you might need to check "@"
target_dir=/home/mariyan/Documents/dev/pcl-trunk

sudo apt -y update update
sudo apt -y update install git

sudo apt -y install g++ cmake cmake-gui doxygen
sudo apt -y install mpi-default-dev openmpi-bin openmpi-common
sudo apt -y install libflann1 libflann-dev libeigen3-dev
sudo apt -y install libboost-all-dev libvtk5.8-qt4 libvtk5.8 libvtk5-dev
sudo apt -y install libqhull* libusb-dev libgtest-dev
sudo apt -y install git-core freeglut3-dev pkg-config
sudo apt -y install build-essential libxmu-dev libxi-dev 
sudo apt -y install libusb-1.0-0-dev graphviz mono-complete
sudo apt -y install qt-sdk openjdk-7-jdk openjdk-7-jre
sudo apt -y install phonon-backend-gstreamer
sudo apt -y install phonon-backend-vlc

git clone https://github.com/PointCloudLibrary/pcl.git $target_dir
ln -s pcl-trunk pcl

cd $target_dir
mkdir build && cd build
cmake -DCMAKE_BUILD_TYPE=None -DBUILD_GPU=ON -DBUILD_apps=ON -DBUILD_examples=ON ..
make -j12

sudo make install

#The library files are installed at    /usr/local/lib, 
#and the header files are installed at /usr/local/include/pcl-X.X

