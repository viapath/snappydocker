# NGS tools (BAM and BED handling)
FROM viapath/snappy_ngstools
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root

# crossmap (GRCh37->hg19)
RUN wget -O /tmp/CrossMap-0.2.tar.gz http://downloads.sourceforge.net/project/crossmap/CrossMap-0.2.tar.gz && \
    cd /tmp && tar xvfz CrossMap-0.2.tar.gz && \
    cd /tmp/CrossMap-0.2 && \
    python setup.py install && \
    rm -rvf /tmp/*

CMD ["/bin/bash"]
