FROM ros:melodic

# base deps
RUN apt-get update && apt-get install -y libglew-dev libopencv-dev \
    libeigen3-dev ros-melodic-tf ros-melodic-image-transport \
    ros-melodic-cv-bridge

# pangolin
RUN git clone https://github.com/stevenlovegrove/Pangolin.git && \
    cd Pangolin && cmake . && make && make install && cd /

# orb-slam
RUN git clone https://github.com/Magical-Chicken/ORB_SLAM2.git && \
    cd ORB_SLAM2 && ./build.sh && \
    ROS_PACKAGE_PATH="${ROS_PACKAGE_PATH}:/ORB_SLAM2/Examples/ROS/ORB_SLAM2" \
    ./build_ros.sh

WORKDIR /ORB_SLAM2/
