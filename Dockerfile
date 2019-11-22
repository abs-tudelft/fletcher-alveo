FROM ubuntu:bionic

RUN apt-get update && apt-get install -y curl make gcc g++ git pkg-config
RUN curl -L https://github.com/Kitware/CMake/releases/download/v3.15.4/cmake-3.15.4-Linux-x86_64.tar.gz | tar xz --strip-components=1 -C /usr/local

ENV XRT xrt_201920.2.3.1301_18.04-xrt.deb
RUN curl -L https://www.xilinx.com/bin/public/openDownload?filename=${XRT} > ${XRT} && \
    apt-get install -y ./${XRT} && rm ${XRT}

ENV XILINX_XRT=/opt/xilinx/xrt
ENV LD_LIBRARY_PATH=$XILINX_XRT/lib:$LD_LIBRARY_PATH
ENV PATH=$XILINX_XRT/bin:$PATH
ENV PYTHONPATH=$XILINX_XRT/python:$PYTHONPATH

RUN apt-get install -y opencl-clhpp-headers

ADD fletcher /fletcher
ADD runtime /src
RUN mkdir /build && cd build && cmake /src && make VERBOSE=1
