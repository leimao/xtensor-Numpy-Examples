FROM ubuntu:24.04

ARG CMAKE_VERSION=3.31.5
ARG PYTHON_VENV_PATH=/python/venv

ENV DEBIAN_FRONTEND=noninteractive

# Install package dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        software-properties-common \
        autoconf \
        automake \
        libtool \
        pkg-config \
        ca-certificates \
        locales \
        locales-all \
        python3-full \
        wget \
        zip \
        unzip \
        git && \
    apt-get clean

# System locale
# Important for UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8

# Install fonts
RUN apt-get update && apt-get install -y --no-install-recommends \
        fonts-wqy-microhei && \
    apt-get clean

RUN mkdir -p ${PYTHON_VENV_PATH} && \
    python3 -m venv ${PYTHON_VENV_PATH}

ENV PATH=${PYTHON_VENV_PATH}/bin:$PATH

RUN cd ${PYTHON_VENV_PATH}/bin && \
    pip install --upgrade pip setuptools wheel

# Install CMake
RUN cd /tmp && \
    wget https://github.com/Kitware/CMake/releases/download/v${CMAKE_VERSION}/cmake-${CMAKE_VERSION}-linux-x86_64.sh && \
    bash cmake-${CMAKE_VERSION}-linux-x86_64.sh --prefix=/usr/local --exclude-subdir --skip-license && \
    rm -rf /tmp/*

# # Install xtensor
# RUN apt-get update && apt-get install -y --no-install-recommends \
#         xtensor-dev && \
#     apt-get clean

# Install xtensor from source
RUN cd /tmp && \
    git clone https://github.com/xtensor-stack/xtl.git && \
    cd xtl && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr && \
    make install && \
    cd /tmp && \
    git clone https://github.com/xtensor-stack/xtensor.git && \
    cd xtensor && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr && \
    make install && \
    rm -rf /tmp/*

# Install NumPy
RUN pip install numpy==2.2.2
