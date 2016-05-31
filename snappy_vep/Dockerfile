FROM viapath/snappy_ngstools:flatdog
MAINTAINER David Brawand <dbrawand@nhs.net>
#ENV HOME /home/vagrant
ENV DEBIAN_FRONTEND noninteractive
ENV PERL_MM_USE_DEFAULT=1
ENV CACHEDIR ${HOME}/work/vep

# install mysql
RUN apt-get install -y mysql-client mysql-server libmysqlclient-dev

# install required perl modules
RUN cpan -i Archive::Extract DBI DBD::mysql CGI Archive::Zip File::Copy::Recursive JSON Sereal

# download and extract VEP GRCh37
RUN cd /usr/local/pipeline && \
    wget -c https://github.com/Ensembl/ensembl-tools/archive/release/84.zip && \
    unzip 84.zip && \
    rm 84.zip

# install VEP
ENV VEPINSTALL /usr/local/pipeline/ensembl-tools-release-84/scripts/variant_effect_predictor
ENV PATH $VEPINSTALL/htslib:$PATH
ENV PERL5LIB $VEPINSTALL:$PERL5LIB
RUN cd $VEPINSTALL && \
    perl INSTALL.pl --AUTO ap \
    --PLUGINS all \
    --NO_HTSLIB

# add own plugins
ADD Grantham.pm $VEPINSTALL

CMD ["/bin/bash"]

## usage:
## perl variant_effect_predictor.pl -i my_input.vcf -fork 4 -cache -vcf --ASSEMBLY GRCh37
