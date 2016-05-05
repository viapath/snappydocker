FROM viapath/snappy_ngstools:flatdog
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root


RUN cd /tmp && \
    wget -c http://soap.genomics.org.cn/down/SOAPindel_20130918_2.1.7.17.zip && \
    unzip SOAPindel_20130918_2.1.7.17.zip && \
    cd /tmp/indel_detection.release && \
    make all && \
    mv /tmp/indel_detection.release /usr/local/pipeline/soapindel && \
    chmod -R 755 /usr/local/pipeline/soapindel && \
    chown -R snappy:snappy /usr/local/pipeline && \
    sed -i '$aPATH=$PATH:/usr/local/pipeline/soapindel' /home/snappy/.bashrc

CMD ["/bin/bash"]
