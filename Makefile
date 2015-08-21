## Docker image makefile
# David Brawand <dbrawand@nhs.net>

VERSION=flatdog

## Basic install  no annotation data bases or manual build tools

publicimages = viapath/snappy_align:$(VERSION) viapath/snappy_align:$(VERSION) \
 	viapath/snappy_bamutil:$(VERSION) viapath/snappy_base:$(VERSION) \
	viapath/snappy_delly:$(VERSION) viapath/snappy_exomedepth:$(VERSION) \
	viapath/snappy_fastqc:$(VERSION) viapath/snappy_freebayes:$(VERSION) \
	viapath/snappy_gviz:$(VERSION) viapath/snappy_kraken:$(VERSION) \
	viapath/snappy_lofreq:$(VERSION) viapath/snappy_lumpy:$(VERSION) \
	viapath/snappy_ngstools:$(VERSION) viapath/snappy_picard:$(VERSION) \
	viapath/snappy_platypus:$(VERSION) viapath/snappy_reporting:$(VERSION) \
	viapath/snappy_samblaster:$(VERSION) viapath/snappy_trimmomatic:$(VERSION) \
	viapath/snappy_vardict:$(VERSION) viapath/snappy_varscan:$(VERSION) \
	viapath/snappy_crossmap:$(VERSION) viapath/snappy_alpaca::$(VERSION)

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
	docker build -t viapath/snappy_base:$(VERSION) snappy_base

ngstools:
	docker build -t viapath/snappy_ngstools:$(VERSION) snappy_ngstools

align: ngstools
	docker build -t viapath/snappy_align:$(VERSION) snappy_align

alpaca: ngstools
	docker build -t viapath/snappy_alpaca:$(VERSION) snappy_alpaca

bamutil: ngstools
	docker build -t viapath/snappy_bamutil:$(VERSION) snappy_bamutil

crossmap: ngstools
	docker build -t viapath/snappy_crossmap:$(VERSION) snappy_crossmap

delly: ngstools
	docker build -t viapath/snappy_delly:$(VERSION) snappy_delly

exomedepth: ngstools
	docker build -t viapath/snappy_exomedepth:$(VERSION) snappy_exomedepth

fastqc: baseimage
	docker build -t viapath/snappy_fastqc:$(VERSION) snappy_fastqc

freebayes: ngstools
	docker build -t viapath/snappy_freebayes:$(VERSION) snappy_freebayes

gviz: reporting
	docker build -t viapath/snappy_gviz:$(VERSION) snappy_gviz

kraken: baseimage
	docker build -t viapath/snappy_kraken:$(VERSION) snappy_kraken

lumpy: ngstools
	docker build -t viapath/snappy_lumpy:$(VERSION) snappy_lumpy

lofreq: ngstools
	docker build -t viapath/snappy_lofreq:$(VERSION) snappy_lofreq

picard: ngstools
	docker build -t viapath/snappy_picard:$(VERSION) snappy_picard

platypus: ngstools
	docker build -t viapath/snappy_platypus:$(VERSION) snappy_platypus

protected: ngstools
	docker build -t dbrawand/snappy_protected:$(VERSION) snappy_protected

reporting: ngstools
	docker build -t viapath/snappy_reporting:$(VERSION) snappy_reporting

samblaster: ngstools
	docker build -t viapath/snappy_samblaster:$(VERSION) snappy_samblaster

trimmomatic: ngstools
	docker build -t viapath/snappy_trimmomatic:$(VERSION) snappy_trimmomatic

vardict: ngstools
	docker build -t viapath/snappy_vardict:$(VERSION) snappy_vardict

varscan: ngstools
	docker build -t viapath/snappy_varscan:$(VERSION) snappy_varscan
