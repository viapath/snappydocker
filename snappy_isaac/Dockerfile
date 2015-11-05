FROM viapath/snappy_ngstools:flatdog
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root

## prerequisites
RUN apt-get install -y rsync

## ISAAC variant caller
RUN cd /tmp && wget --no-verbose https://github.com/sequencing/isaac_variant_caller/archive/v1.0.7.tar.gz && \
    tar xvfz /tmp/v1.0.7.tar.gz && cd /tmp/isaac_variant_caller-1.0.7 && \
    ./configure --prefix=/usr/local/pipeline/ivc && \
    make && \
    sed -i '$aPATH=$PATH:/usr/local/pipeline/ivc/bin' /home/snappy/.bashrc && \
    chmod -R 755 /usr/local/pipeline/ivc/bin/configureWorkflow.pl && \
    chown -R snappy:snappy /usr/local/pipeline && \
    rm -rvf /tmp/*


ENV PERL5LIB=/usr/local/pipeline/ivc

CMD ["/bin/bash"]
