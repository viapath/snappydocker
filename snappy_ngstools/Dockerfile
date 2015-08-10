# NGS tools (BAM and BED handling)
FROM viapath/snappy_base
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root

# htslib && samtools
RUN cd /tmp && \
    git clone --branch=master git://github.com/samtools/htslib.git && \
    cd htslib && \
    autoconf && \
    ./configure  && \
    make && \
    make install && \
    cd /tmp && \
    git clone --branch=master git://github.com/samtools/samtools.git && \
    cd samtools && \
    git checkout 1.2 && \
    make && \
    make install && \
    cd .. && \
    rm -rf /tmp/samtools /tmp/htslib

# install python modules for samtools (pysam)
RUN sudo pip install pysam

# bedtools
RUN cd /tmp && \
    git clone https://github.com/arq5x/bedtools2.git && \
    cd bedtools2 && \
    git checkout v2.24.0 && \
    make clean && \
    make all && \
    chmod +x bin/bedtools && \
    mv bin/bedtools /usr/local/bin/ && \
    cd .. && \
    rm -rf /tmp/bedtools2

# sambamba (for future use)
RUN cd /tmp && \
    wget https://github.com/lomereiter/sambamba/releases/download/v0.5.8/sambamba_v0.5.8_linux.tar.bz2 && \
    tar -xjvf sambamba_v0.5.8_linux.tar.bz2 && \
    mv sambamba_v0.5.8 /usr/local/bin/sambamba && \
    chmod +rwx /usr/local/bin/sambamba && \
    rm -rf /tmp/sambamba_v0.5.8_linux.tar.bz2

# Clean up when done
RUN rm -rvf /tmp/* && \
    rm -rf /var/tmp/* && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/

CMD ["/bin/bash"]
