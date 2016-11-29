FROM viapath/snappy_ngstools:flatdog
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root

# dependencies 
RUN apt-get update -y && apt-get install -y bzip2 gcc g++ make python zlib1g-dev

# set manta version
ENV MANTA_VERSION 1.0.3

# Download and build manta
RUN cd /tmp && \
	wget https://github.com/Illumina/manta/releases/download/v${MANTA_VERSION}/manta-${MANTA_VERSION}.release_src.tar.bz2 && \
	tar -xjf manta-${MANTA_VERSION}.release_src.tar.bz2
RUN cd /tmp && \
	mkdir build && \
	cd build && \
	../manta-${MANTA_VERSION}.release_src/configure --jobs=4 --prefix=/usr/local/pipeline/manta && \
	make -j4 install

# Ensure that CC and CXX are updated to target compiler if needed, e.g.:
#     export CC=/path/to/cc
#     export CXX=/path/to/c++



# WHAM from source
#RUN mkdir -p /usr/local/pipeline/ && cd /usr/local/pipeline/ && \
#    git clone --recursive https://github.com/zeeev/wham.git && \
#    cd /usr/local/pipeline/wham && make && \
#    chmod -R 755 /usr/local/pipeline/wham && \
#    chown -R snappy:snappy /usr/local/pipeline && \
#    ln -s /usr/local/pipeline/wham/bin/WHAM-GRAPHENING /usr/local/bin/ && \
#    ln -s /usr/local/pipeline/wham/bin/WHAM-BAM /usr/local/bin/ && \
#    sed -i '$aPATH=$PATH:/usr/local/pipeline/wham/bin' /home/snappy/.bashrc

CMD ["/bin/bash"]
