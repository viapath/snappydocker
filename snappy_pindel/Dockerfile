FROM viapath/snappy_ngstools:flatdog
MAINTAINER David Brawand <dbrawand@nhs.net>
ENV HOME /root

RUN apt-get update && \
	apt-get install -y libnss-sss libopenblas-base libopenblas-dev && \
	apt-get clean

RUN cd /usr/local/pipeline/ && \
	git clone --recursive https://github.com/genome/pindel.git && \
	cd /usr/local/pipeline/pindel/ && ./INSTALL /usr/local/htslib && \
	ln -s /usr/local/pipeline/pindel/pindel /usr/local/bin/pindel

CMD ["/bin/bash"]
