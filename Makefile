## Docker image makefile
# David Brawand <dbrawand@nhs.net>

## Basic install  no annotation data bases or manual build tools

publicimages = viapath/snappy_align viapath/snappy_align viapath/snappy_bamutil \
	viapath/snappy_base viapath/snappy_delly viapath/snappy_exomedepth \
	viapath/snappy_fastqc viapath/snappy_freebayes viapath/snappy_gviz \
	viapath/snappy_kraken viapath/snappy_lofreq viapath/snappy_lumpy \
	viapath/snappy_ngstools viapath/snappy_picard viapath/snappy_platypus \
	viapath/snappy_reporting viapath/snappy_samblaster viapath/snappy_trimmomatic \
	viapath/snappy_vardict viapath/snappy_varscan viapath/snappy_crossmap

privateimages = dbrawand/snappy_protected

all: buildall pushall

buildall: buildpublic buildprivate

pushall: pushpublic pushprivate

login:
	docker login

## PUSH
pushpublic: buildpublic
	docker push $(publicimages)

pushprivate: buildprivate
	docker push $(privateimages)

## PULL
pull: login
	docker pull $(publicimages)
	docker pull $(privateimages)

## BUILD
buildpublic: baseimage ngstools align bamutil crossmap delly exomedepth fastqc freebayes gviz kraken lumpy lofreq picard platypus reporting samblaster trimmomatic vardict varscan

buildprivate: protected

# INDIVIDUAL BUILDS
baseimage:
	docker build -t viapath/snappy_base snappy_base

ngstools:
	docker build -t viapath/snappy_ngstools snappy_ngstools

align: ngstools
	docker build -t viapath/snappy_align snappy_align

bamutil: ngstools
	docker build -t viapath/snappy_bamutil snappy_bamutil

crossmap: ngstools
	docker build -t viapath/snappy_crossmap snappy_crossmap

delly: ngstools
	docker build -t viapath/snappy_delly snappy_delly

exomedepth: ngstools
	docker build -t viapath/snappy_exomedepth snappy_exomedepth

fastqc: baseimage
	docker build -t viapath/snappy_fastqc snappy_fastqc

freebayes: ngstools
	docker build -t viapath/snappy_freebayes snappy_freebayes

gviz: reporting
	docker build -t viapath/snappy_gviz snappy_gviz

kraken: baseimage
	docker build -t viapath/snappy_kraken snappy_kraken

lumpy: ngstools
	docker build -t viapath/snappy_lumpy snappy_lumpy

lofreq: ngstools
	docker build -t viapath/snappy_lofreq snappy_lofreq

picard: ngstools
	docker build -t viapath/snappy_picard snappy_picard

platypus: ngstools
	docker build -t viapath/snappy_platypus snappy_platypus

protected: ngstools
	docker build -t dbrawand/snappy_protected snappy_protected

reporting: ngstools
	docker build -t viapath/snappy_reporting snappy_reporting

samblaster: ngstools
	docker build -t viapath/snappy_samblaster snappy_samblaster

trimmomatic: ngstools
	docker build -t viapath/snappy_trimmomatic snappy_trimmomatic

vardict: ngstools
	docker build -t viapath/snappy_vardict snappy_vardict

varscan: ngstools
	docker build -t viapath/snappy_varscan snappy_varscan
