# Snappy base image (python packages and basic tools)

FROM viapath/snappy_base
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root

# pyHGVS 0.9.4
RUN cd /tmp && \
    git clone https://github.com/counsyl/hgvs.git && \
    cd hgvs && git checkout aebe5bd9683f4b5937fd653ce4b13fcd4f3ebb10 && \
    python setup.py install && \
    rm -rf /tmp/*

# install R packages (knitr etc)
COPY install.R /tmp/
RUN Rscript --no-save --no-restore /tmp/install.R && \
    rm -f /tmp/install.R

CMD ["/bin/bash"]
