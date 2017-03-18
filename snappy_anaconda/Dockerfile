# Anaconda/bioconda based tools
FROM viapath/snappy_base:flatdog
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root

# anaconda install
ENV INSTALL_PATH /usr/local/pipeline/anaconda
RUN wget http://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && \
    bash Miniconda2-latest* -fbp $INSTALL_PATH
ENV PATH $INSTALL_PATH/bin:$PATH

# bioconda
RUN conda update -y conda && \
    conda config --add channels bioconda

# peddy
RUN conda install -y peddy


CMD ["/bin/bash"]
