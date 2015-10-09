FROM viapath/snappy_ngstools
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root

# this container is not for redistribution and must be kept in a private repository

## GATK
RUN cd /tmp && wget --no-check-certificate https://www.dropbox.com/s/wey1edv9tqdc7so/GenomeAnalysisTK-3.2-2.tar.bz2 && \
    mkdir /usr/local/pipeline/GenomeAnalysisTK-3.2-2 && \
    tar xjvf /tmp/GenomeAnalysisTK-3.2-2.tar.bz2 -C /usr/local/pipeline/GenomeAnalysisTK-3.2-2 && \
    chmod -R 755 /usr/local/pipeline/GenomeAnalysisTK-3.2-2 && \
    chown -R snappy:snappy /usr/local/pipeline && \
    sed -i '$aCLASSPATH=.:$CLASSPATH:/usr/local/pipeline/GenomeAnalysisTK-3.2-2/GenomeAnalysisTK.jar' /home/snappy/.bashrc && \
    sed -i '$aPATH=$PATH:/usr/local/pipeline/GenomeAnalysisTK-3.2-2' /home/snappy/.bashrc && \
    rm -rvf /tmp/*

## ANNOVAR (see licence and registration, has to be manually added)
RUN cd /tmp && wget --no-check-certificate http://www.openbioinformatics.org/annovar/download/0wgxR2rIVP/annovar.latest.tar.gz && \
    tar xzvf annovar.latest.tar.gz -C /usr/local/pipeline && \
    sed -i '$aPATH=$PATH:/usr/local/pipeline/annovar' /home/snappy/.bashrc && \
    chmod -R 755 /usr/local/pipeline/annovar && \
    chown -R snappy:snappy /usr/local/pipeline && \
    rm -rvf /tmp/*

## SnpEff
RUN wget -O /tmp/snpEff_latest_core.zip http://sourceforge.net/projects/snpeff/files/snpEff_latest_core.zip && \
    unzip /tmp/snpEff_latest_core.zip -d /usr/local/pipeline/ && \
    chmod -R 775 /usr/local/pipeline/snpEff && \
    chown -R snappy:snappy /usr/local/pipeline && \
    sed -i '$aCLASSPATH=.:$CLASSPATH:/usr/local/pipeline/snpEff/snpEff.jar' /home/snappy/.bashrc && \
    sed -i '$aPATH=$PATH:/usr/local/pipeline/snpEff' /home/snappy/.bashrc && \
    rm -rvf /tmp/*

## download snpEff database (hg19)
RUN java -jar /usr/local/pipeline/snpEff/snpEff.jar download -v -dataDir /usr/local/pipeline/snpEff hg19

CMD ["/bin/bash"]
