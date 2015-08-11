## Docker image makefile
# David Brawand <dbrawand@nhs.net>

## Basic install  no annotation data bases or manual build tools
all: dockerimages

update:
	git pull

login:
	docker login

buildpublic: fastqc trimmomatic kraken align

buildprivate: protected

pushpublic: buildpublic
	docker push viapath/snappy_base
	docker push viapath/snappy_ngstools
	docker push viapath/snappy_fastqc
	docker push viapath/snappy_trimmomatic
	docker push viapath/snappy_kraken
	docker push viapath/snappy_align
	docker push viapath/snappy_bamutil
	docker push viapath/snappy_picard
	docker push viapath/snappy_samblaster

pushprivate: buildprivate
	docker push dbrawand/snappy_protected

baseimage:
	docker pull viapath/snappy_base

ngstools: baseimage
	docker pull viapath/snappy_ngstools

fastqc: baseimage
	docker pull viapath/snappy_fastqc

trimmomatic: baseimage
	docker pull compbio/snappy_trimmomatic

kraken: baseimage
	docker build -t viapath/snappy_kraken snappy_kraken

align: ngstools
	docker build -t viapath/snappy_align snappy_align

picard: ngstools
	docker build -t viapath/snappy_picard snappy_picard

bamutil: ngstools
	docker build -t viapath/snappy_bamutil snappy_bamutil

samblaster: ngstools
	docker build -t viapath/snappy_samblaster snappy_samblaster


## protected software
protected: ngstools
	docker build -t dbrawand/snappy_protected snappy_protected
