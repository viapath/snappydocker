FROM viapath/snappy_ngstools
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root

## VarScan2
RUN mkdir -p /usr/local/pipeline/varScan2 && \
    wget -O /usr/local/pipeline/varScan2/VarScan.v2.3.7.jar http://downloads.sourceforge.net/project/varscan/VarScan.v2.3.7.jar && \
    chmod -R 755 /usr/local/pipeline/varScan2 && \
    chown -R snappy:snappy /usr/local/pipeline && \
    sed -i '$aCLASSPATH=.:$CLASSPATH:/usr/local/pipeline/varScan2/VarScan.v2.3.7.jar' /home/snappy/.bashrc && \
    sed -i '$aPATH=$PATH:/usr/local/pipeline/varScan2' /home/snappy/.bashrc

CMD ["/bin/bash"]
