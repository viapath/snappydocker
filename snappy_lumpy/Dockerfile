FROM viapath/snappy_ngstools
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root

# lumpy-sv (requires samtools,bedtools,bamtools) v0.2.11
RUN cd /tmp && \
    git clone --recursive https://github.com/arq5x/lumpy-sv.git && \
    cd lumpy-sv && git checkout 0.2.11 && \
    make && \
    mv bin /usr/local/pipeline/lumpy-sv && \
    chmod -R 755 /usr/local/pipeline/lumpy-sv && \
    chown -R snappy:snappy /usr/local/pipeline && \
    ln -s /usr/local/pipeline/lumpy-sv/* /usr/local/bin/ && \
    sed -i '$aPATH=$PATH:/usr/local/pipeline/lumpy-sv' /home/snappy/.bashrc && \
    rm -rf /tmp/*

CMD ["/bin/bash"]
