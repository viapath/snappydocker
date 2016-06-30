FROM viapath/snappy_ngstools:flatdog
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root

# this container is not for redistribution and must be kept in a private repository due to licensing restrictions

## GATK 3.5
RUN mkdir /usr/local/pipeline/GenomeAnalysisTK-3.5
ADD GenomeAnalysisTK-3.5.tar.bz2 /usr/local/pipeline/GenomeAnalysisTK-3.5
RUN chmod -R 755 /usr/local/pipeline/GenomeAnalysisTK-3.5 && \
    chown -R snappy:snappy /usr/local/pipeline && \
    sed -i '$aCLASSPATH=.:$CLASSPATH:/usr/local/pipeline/GenomeAnalysisTK-3.5/GenomeAnalysisTK.jar' /home/snappy/.bashrc && \
    sed -i '$aPATH=$PATH:/usr/local/pipeline/GenomeAnalysisTK-3.5' /home/snappy/.bashrc && \
    rm -rvf /tmp/*

## GATK 3.6 (no indel realignment necessary)
RUN mkdir /usr/local/pipeline/GenomeAnalysisTK-3.6
ADD GenomeAnalysisTK-3.6.tar.bz2 /usr/local/pipeline/GenomeAnalysisTK-3.6
RUN chmod -R 755 /usr/local/pipeline/GenomeAnalysisTK-3.6 && \
    chown -R snappy:snappy /usr/local/pipeline && \
    sed -i '$aCLASSPATH=.:$CLASSPATH:/usr/local/pipeline/GenomeAnalysisTK-3.6/GenomeAnalysisTK.jar' /home/snappy/.bashrc && \
    sed -i '$aPATH=$PATH:/usr/local/pipeline/GenomeAnalysisTK-3.6' /home/snappy/.bashrc && \
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

## Real Time Genomics Toolbox
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/jre
RUN cd /tmp && \
    git clone https://github.com/RealTimeGenomics/rtg-tools.git && \
    cd /tmp/rtg-tools && git checkout 3.6.2 && \
    ant runalltests && ant zip-nojre && \
    mkdir -p /usr/local/pipeline/rtg-tools && mv build/rtg-tools.jar /usr/local/pipeline/rtg-tools/ && \
    cd /usr/local/pipeline && rm -rf /tmp/rtg-tools && \
    chmod -R 775 /usr/local/pipeline/rtg-tools && \
    chown -R snappy:snappy /usr/local/pipeline && \
    sed -i '$aCLASSPATH=.:$CLASSPATH:/usr/local/pipeline/rtg-tools/rtg-tools.jar' /home/snappy/.bashrc && \
    sed -i '$aPATH=$PATH:/usr/local/pipeline/rtg-tools' /home/snappy/.bashrc

CMD ["/bin/bash"]
