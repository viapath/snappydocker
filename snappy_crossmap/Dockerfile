# NGS tools (BAM and BED handling)
FROM viapath/snappy_ngstools:flatdog
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root

# get select kentSrc tools
RUN wget -O /usr/local/bin/bedGraphToBigWig https://github.com/ENCODE-DCC/KentUtils/raw/master/bin/linux.x86_64/bedGraphToBigWig && \
    chmod 755 /usr/local/bin/bedGraphToBigWig
RUN wget -O /usr/local/bin/wigToBigWig https://github.com/ENCODE-DCC/KentUtils/raw/master/bin/linux.x86_64/wigToBigWig && \
    chmod 755 /usr/local/bin/wigToBigWig

# crossmap (GRCh37->hg19)
RUN wget -O /tmp/CrossMap-0.2.1.tar.gz http://downloads.sourceforge.net/project/crossmap/CrossMap-0.2.1.tar.gz && \
    cd /tmp && tar xvfz CrossMap-0.2.1.tar.gz && \
    cd /tmp/CrossMap-0.2.1 && \
    python setup.py install && \
    rm -rvf /tmp/*

CMD ["/bin/bash"]
