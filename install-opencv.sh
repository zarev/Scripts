#!/bin/bash
#installed on ubuntu18.04 for c++
#compiling code https://www.learnopencv.com/how-to-compile-opencv-sample-code/
#adapted from https://www.learnopencv.com/install-opencv3-on-ubuntu/
echo "Installing the latest OpenCV for C++."

#this is where opencv will be located
target_dir=/usr/local
sh

# # echo "Updating packages and downloading dependencies..."
#update sys packages
sudo apt -y update
sudo apt -y upgrade

# # #dependencies
sudo apt -y remove x264 libx264-dev
 
# # ## Install dependencies
sudo apt -y install build-essential checkinstall cmake pkg-config yasm
sudo apt -y install git gfortran
sudo apt -y install libjpeg8-dev libpng-dev

# # #python dependencies
sudo apt -y install python-dev python-numpy libtbb2 libtbb-dev 
sudo apt -y libjpeg-dev libpng-dev libtiff-dev libjasper-dev


sudo apt -y install software-properties-common
sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
sudo apt -y update
 
sudo apt -y install libjasper1
sudo apt -y install libtiff-dev
 
sudo apt -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt -y install libxine2-dev libv4l-dev

cd /usr/include/linux
sudo ln -s -f ../libv4l1-videodev.h videodev.h
 
sudo apt -y install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt -y install libgtk2.0-dev libtbb-dev qt5-default
sudo apt -y install libatlas-base-dev
sudo apt -y install libfaac-dev libmp3lame-dev libtheora-dev
sudo apt -y install libvorbis-dev libxvidcore-dev
sudo apt -y install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt -y install libavresample-dev
sudo apt -y install x264 v4l-utils

# #setup for clean install
sudo rm -rf  $target_dir/opencv
sudo rm -rf  $target_dir/opencv_contrib
sudo mkdir   $target_dir/opencv
sudo mkdir   $target_dir/opencv_contrib

# #clone opencv repos
echo "Downloading opencv and opencv contrib repos..."
sudo git clone https://github.com/opencv/opencv.git $target_dir/opencv 
sudo git clone https://github.com/opencv/opencv_contrib.git $target_dir/opencv_contrib

sudo mkdir $target_dir/opencv/installation/
install_dir=$target_dir/opencv/installation/

#build opencv
sudo mkdir $target_dir/opencv/build
cd $target_dir/opencv/build/

sudo cmake -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=$install_dir \
        -D INSTALL_C_EXAMPLES=OFF \
        -D INSTALL_PYTHON_EXAMPLES=OFF \
        -D WITH_TBB=ON \
        -D WITH_V4L=ON \
        -D WITH_QT=ON \
        -D WITH_OPENGL=ON \
        -D OPENCV_ENABLE_NONFREE=ON \
        -D OPENCV_GENERATE_PKGCONFIG=ON \
        -D OPENCV_EXTRA_MODULES_PATH=$target_dir/opencv_contrib/modules/ \
        -D BUILD_EXAMPLES=ON ..
      
make -j12

sudo make install

sudo 'export PKG_CONFIG_PATH="{$PKG_CONFIG_PATH}:/usr/local/opencv/installation/lib/pkgconfig"'

sudo ldconfig

sudo sh -c 'echo "/usr/local/lib/x86_64-linux-gnu" >> /etc/ld.so.conf.d/opencv4.conf'
sudo ln -s  /usr/lib/x86_64-linux-gnu/libproj.so.9 /usr/lib/x86_64-linux-gnu/libproj.so


#if installed correctly, this will print a list of libraries
pkg-config --cflags --libs opencv4


echo "Done installing opencv."

