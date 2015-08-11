FROM viapath/snappy_ngstools
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root

## Picard
RUN wget -O /tmp/picard-tools-1.115.zip http://sourceforge.net/projects/picard/files/picard-tools/1.115/picard-tools-1.115.zip && \
    unzip /tmp/picard-tools-1.115.zip -d /usr/local/pipeline/ && \
    sed -i '$aCLASSPATH=.:$CLASSPATH:/usr/local/pipeline/picard-tools-1.115' /home/snappy/.bashrc && \
    sed -i '$aPATH=$PATH:/usr/local/pipeline/picard-tools-1.115' /home/snappy/.bashrc && \
    chown -R snappy:snappy /usr/local/pipeline && \
    rm -rvf /tmp/*

# R (without anything)
RUN sudo apt-get update && \
    sudo apt-get -y install r-base && \
    apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y

CMD ["/bin/bash"]
