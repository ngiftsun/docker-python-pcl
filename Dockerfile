FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get install -y build-essential && \
    apt-get install -y devscripts debhelper dh-exec cmake python-sphinx libboost-system-dev libboost-filesystem-dev libboost-thread-dev libboost-date-time-dev libboost-iostreams-dev libeigen3-dev libflann-dev libvtk6-dev libqhull-dev libopenni-dev libqt5opengl5-dev libqt4-opengl-dev libusb-1.0-0-dev freeglut3-dev libxmu-dev libxi-dev libvtk6-qt-dev doxygen doxygen-latex libproj-dev

RUN dget -u https://launchpad.net/ubuntu/+archive/primary/+files/pcl_1.7.2-14ubuntu1.16.04.1.dsc
WORKDIR "/pcl-1.7.2"

RUN apt-get install -y python-pip git
RUN apt-get install -y python-dev
RUN pip install cython
RUN pip install numpy

RUN dpkg-buildpackage -r -uc -b
RUN dpkg -i ../libpcl_*.deb
#RUN pip install git+https://github.com/strawlab/python-pcl.git#egg=pcl
