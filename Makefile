## Docker image makefile
# David Brawand <dbrawand@nhs.net>

## Basic install  no annotation data bases or manual build tools
all: dockerimages

update:
	git pull

dockerimages: baseimage fastqc trimmomatic ngstools

baseimage:
	docker pull viapath/snappy_base

ngstools: baseimage
	docker pull viapath/snappy_ngstools

fastqc: baseimage
	docker pull viapath/snappy_fastqc

trimmomatic: baseimage
	docker pull compbio/snappy_trimmomatic
