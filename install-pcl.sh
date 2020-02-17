#!/bin/bash
#adapted from https://larrylisky.com/2014/03/03/installing-pcl-on-ubuntu/
#make sure Pre-Released updates are enabled in the System Preferences
#download pcl from http://www.pointclouds.org/downloads/linux.html

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

sudo ln -s  /usr/lib/x86_64-linux-gnu/libproj.so.9 /usr/lib/x86_64-linux-gnu/libproj.so


#The library files are installed at    /usr/local/lib, 
#and the header files are installed at /usr/local/include/pcl-X.X
#PCL_INCLUDE_DIRS: 
                    # /usr/local/include/pcl-1.10 
                    # /usr/include/eigen3
                    # /usr/include
                    # /usr/include/vtk-6.3
                    # /usr/include/freetype2
                    # /usr/include/x86_64-linux-gnu
                    # /usr/include/ni
                    # /usr/include/openni2
#PCL_LIBRARY_DIRS:
                    # /usr/local/lib
#PCL_DEFINITIONS:
                    # -DDISABLE_PCAP-DDISABLE_PNG-DDISABLE_LIBUSB_1_0
#PCL_LIBRARIES:
                    # /usr/lib/x86_64-linux-gnu/libboost_system.so
                    # /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
                    # /usr/lib/x86_64-linux-gnu/libboost_date_time.so
                    # /usr/lib/x86_64-linux-gnu/libboost_iostreams.so
                    # /usr/lib/x86_64-linux-gnu/libboost_serialization.so
                    # /usr/lib/x86_64-linux-gnu/libboost_regex.so
                    # /usr/lib/x86_64-linux-gnu/libqhull.so
                    # /usr/lib/x86_64-linux-gnu/libqhull.so
                    # /usr/lib/libOpenNI.so
                    # /usr/lib/libOpenNI2.so
                    # /usr/lib/x86_64-linux-gnu/libfreetype.so
                    # /usr/lib/x86_64-linux-gnu/libz.so
                    # /usr/lib/x86_64-linux-gnu/libjpeg.so
                    # /usr/lib/x86_64-linux-gnu/libpng.so
                    # /usr/lib/x86_64-linux-gnu/libtiff.so