FROM viapath/snappy_ngstools:flatdog
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root

# bamUtil (including libStatGen)
RUN cd /tmp && \
    git clone https://github.com/statgen/libStatGen.git && \
    cd libStatGen && \
    git checkout v1.0.13 && \
    make all && \
    make install && \
    cd /tmp && \
    git clone https://github.com/statgen/bamUtil.git && \
    cd bamUtil && \
    git checkout v1.0.13 && \
    make install INSTALLDIR=/usr/local/pipeline/bamUtil_1.0.12 && \
    sed -i '$aPATH=$PATH:/usr/local/pipeline/bamUtil_1.0.12' /home/snappy/.bashrc && \
    ln -s /usr/local/pipeline/bamUtil_1.0.12/bam /usr/bin/local && \
    chmod -R 755 /usr/local/pipeline && \
    chown -R snappy:snappy /usr/local/pipeline && \
    rm -rvf /tmp/*

# verifyBamID
RUN cd /tmp && \
	wget https://github.com/statgen/verifyBamID/releases/download/v1.1.3/verifyBamIDLibStatGen.1.1.3.tgz && \
	tar xvfz verifyBamIDLibStatGen.1.1.3.tgz && \
	cd verifyBamID_1.1.3 && \
	make && make install && \
	rm -rf /tmp/verifyBamID_1.1.3
	
CMD ["/bin/bash"]
