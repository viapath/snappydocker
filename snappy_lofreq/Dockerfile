FROM viapath/snappy_picard:flatdog
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root

## lofreq
RUN wget -O /tmp/lofreq_star-2.1.2_linux-x86-64.tgz http://downloads.sourceforge.net/project/lofreq/lofreq_star-2.1.2_linux-x86-64.tgz && \
    tar xzvf /tmp/lofreq_star-2.1.2_linux-x86-64.tgz -C /usr/local/pipeline/ && \
    chmod -R 755 /usr/local/pipeline/lofreq_star-2.1.2/bin/* && \
    chown -R snappy:snappy /usr/local/pipeline && \
    sed -i '$aPATH=$PATH:/usr/local/pipeline/lofreq_star-2.1.2/bin' /home/snappy/.bashrc && \
    rm -rf /tmp/*

CMD ["/bin/bash"]
