# Snappy base image (python packages and basic tools)

FROM debian:jessie
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root

# Basic build tools and python install
RUN apt-get update && apt-get dist-upgrade -y && \
    apt-get install -y --no-install-recommends \
    apt-utils \
    ant \
    automake \
    bash \
    binutils \
    build-essential \
    bzip2 \
    cmake \
    curl \
    dkms \
    dpkg-dev \
    gcc \
    g++ \
    gpp \
    gcc \
    git \
    git-core \
    gfortran \
    gnuplot \
    graphviz \
    htop \
    libatlas-dev \
    libblas-dev \
    libbz2-dev \
    libc-bin \
    libconfig-dev \
    libfreetype6-dev \
    liblapack-dev \
    liblzma-dev \
    libpcre3-dev \
    libpng-dev \
    libreadline-dev \
    libssl-dev \
    libxml2-dev \
    llvm \
    locales \
    make \
    ncurses-dev \
    openssl \
    openssl-blacklist \
    parallel \
    pkg-config \
    python \
    python-dev \
    python2.7-dev \
    python-pip \
    python-yaml \
    ssl-cert \
    sudo \
    tabix \
    tree \
    unzip \
    vim \
    wget \
    zlib1g-dev && \
    apt-get clean && \
    apt-get purge

# install python modules
RUN sudo pip install \
    Cython \
    pytabix \
    python-dateutil \
    numpy \
    matplotlib \
    regex \
    deepdiff \
    intervaltree \
    pygr \
    XlsxWriter

# install basespace API
RUN mkdir -p /usr/local/pipeline && \
    cd /usr/local/pipeline && \
    git clone https://github.com/basespace/basespace-python-sdk.git && \
    cd /usr/local/pipeline/basespace-python-sdk/src && \
    sudo python setup.py install && \
    cd /usr/local/pipeline && \
    rm -rf /usr/local/pipeline/basespace-python-sdk

# snappy user (and same group)
RUN useradd -m -s /bin/bash snappy && \
  cd /home/snappy && \
  touch /home/snappy/.bashrc

# JAVA install
RUN apt-get install -y openjdk-7-jre openjdk-7-jdk openjdk-7-doc openjdk-7-jre-lib && \
    sed -i 'aPATH=$PATH:/usr/lib/jvm/java-7-openjdk-amd64/jre/bin' /root/.bashrc && \
    sed -i 'aPATH=$PATH:/usr/lib/jvm/java-7-openjdk-amd64/jre/bin' /home/snappy/.bashrc && \
    apt-get clean && \
    apt-get purge
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/jre/bin/java

# snappy install directory
RUN chown -R snappy:snappy /usr/local/pipeline && \
  chmod 775 /usr/local/pipeline && \
  chmod -R 777 /usr/local/pipeline && \
  chown -R snappy:snappy /usr/local/pipeline

# Clean up when done
RUN rm -rf /tmp/* /var/tmp/* && \
    apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ && \
    rm -rf /usr/local/pipeline/*.gz /usr/local/pipeline/*.bz2 /usr/local/pipeline/*.tgz

# Use baseimage-docker's bash.
CMD ["/bin/bash"]
