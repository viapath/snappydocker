FROM viapath/snappy_ngstools:flatdog
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root


# install rgl dependencies
RUN apt-get update && apt-get install -y r-cran-rgl libglu1-mesa-dev freeglut3-dev mesa-common-dev libpoppler-cpp-dev

# install R packages (knitr etc)
COPY install.R /tmp/
RUN Rscript --no-save --no-restore /tmp/install.R && \
    rm -f /tmp/install.R

# install GNUplot perl module
# RUN cpan -i Gnuplot::Builder

# python modules
RUN pip install pandas && \
	pip install matplotlib_venn && \
	pip install seaborn

CMD ["/bin/bash"]
