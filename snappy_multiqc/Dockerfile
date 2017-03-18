# multiQC report
FROM viapath/snappy_ngstools:flatdog
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root


# multiQC (run once to build font cache)
RUN pip install multiqc && \
    multiqc -h

CMD ["/bin/bash"]
