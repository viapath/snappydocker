FROM viapath/snappy_ngstools
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root

# lumpy-sv (requires samtools,bedtools,bamtools) v0.2.11
RUN cd /usr/local/pipeline && \
    git clone --recursive https://github.com/arq5x/lumpy-sv.git && \
    cd lumpy-sv && git checkout 0.2.11
RUN cd /usr/local/pipeline/lumpy-sv && \
    make && \
    ln -s /usr/local/pipeline/lumpy-sv/* /usr/local/bin/ && \
    chmod -R 755 /usr/local/pipeline/lumpy-sv && \
    chown -R snappy:snappy /usr/local/pipeline && \
    sed -i '$aPATH=$PATH:/usr/local/pipeline/lumpy-sv/bin' /home/snappy/.bashrc && \
    rm -rf /usr/local/pipeline/lumpy/.git

CMD ["/bin/bash"]
