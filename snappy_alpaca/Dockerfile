FROM viapath/snappy_ngstools
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root

# install miniconda
RUN wget http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O miniconda.sh && \
    bash miniconda.sh -b -p /usr/local/anaconda && rm miniconda.sh
ENV PATH /usr/local/anaconda/bin:$PATH
ONBUILD ENV PATH /usr/local/anaconda/bin:$PATH

# install alpaca variant caller
RUN conda install -y -c johanneskoester alpaca

CMD ["/bin/bash"]
