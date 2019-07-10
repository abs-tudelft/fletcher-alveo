FROM fletcher-alveo/driver:latest

RUN printf "[apache-arrow]\n\
name=Apache Arrow\n\
baseurl=https://dl.bintray.com/apache/arrow/centos/\$releasever/\$basearch/\n\
gpgcheck=1\n\
enabled=1\n\
gpgkey=https://dl.bintray.com/apache/arrow/centos/RPM-GPG-KEY-apache-arrow" > /etc/yum.repos.d/Apache-Arrow.repo && \
    yum install -y \
      epel-release && \
    yum install -y \
      arrow-dataset-devel \
      arrow-devel \
      arrow-flight-devel \
      arrow-python-devel \
      curl \
      gandiva-devel \
      gcc-c++ \
      parquet-devel && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    curl -L https://github.com/Kitware/CMake/releases/download/v3.14.5/cmake-3.14.5-Linux-x86_64.tar.gz | tar xz --strip-components=1 -C /usr/local

ADD . /runtime
WORKDIR /build
RUN cmake /runtime && make
