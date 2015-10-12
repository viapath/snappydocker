## Docker image makefile
# David Brawand <dbrawand@nhs.net>

VERSION=flatdog

login:
	docker login

## PULL
pullall: pullprivate pullpublic

pullpublic: pull_base pull_ngstools pull_fastqc pull_kraken pull_platypus pull_trimmomatic pull_align pull_alpaca pull_bamutil pull_crossmap pull_delly pull_freebayes pull_lumpy pull_picard pull_reporting pull_samblaster pull_vardict pull_varscan pull_lofreq pull_exomedepth pull_gviz

pullprivate: login pull_protected

pull_protected:
	docker pull dbrawand/snappy_protected:$(VERSION)

pull_base:
	docker pull viapath/snappy_base:$(VERSION)

# base deps
pull_ngstools:
	docker pull viapath/snappy_ngstools:$(VERSION)

pull_fastqc:
	docker pull viapath/snappy_fastqc:$(VERSION)

pull_kraken:
	docker pull viapath/snappy_kraken:$(VERSION)

pull_platypus:
	docker pull viapath/snappy_platypus:$(VERSION)

pull_trimmomatic:
	docker pull viapath/snappy_trimmomatic:$(VERSION)

# ngstools deps
pull_align:
	docker pull viapath/snappy_align:$(VERSION)

pull_alpaca:
	docker pull viapath/snappy_alpaca:$(VERSION)

pull_bamutil:
	docker pull viapath/snappy_bamutil:$(VERSION)

pull_crossmap:
	docker pull viapath/snappy_crossmap:$(VERSION)

pull_delly:
	docker pull viapath/snappy_delly:$(VERSION)

pull_freebayes:
	docker pull viapath/snappy_freebayes:$(VERSION)

pull_lumpy:
	docker pull viapath/snappy_lumpy:$(VERSION)

pull_picard:
	docker pull viapath/snappy_picard:$(VERSION)

pull_reporting:
	docker pull viapath/snappy_reporting:$(VERSION)

pull_samblaster:
	docker pull viapath/snappy_samblaster:$(VERSION)

pull_vardict:
	docker pull viapath/snappy_vardict:$(VERSION)

pull_varscan:
	docker pull viapath/snappy_varscan:$(VERSION)

# picard deps
pull_lofreq:
	docker pull viapath/snappy_lofreq:$(VERSION)

# reporting deps
pull_exomedepth:
	docker pull viapath/snappy_exomedepth:$(VERSION)

pull_gviz:
	docker pull viapath/snappy_gviz:$(VERSION)


## BUILD
buildall: buildpublic buildprivate

buildpublic: baseimage ngstools align bamutil crossmap delly exomedepth fastqc freebayes gviz kraken lumpy lofreq picard platypus reporting samblaster trimmomatic vardict varscan

buildprivate: protected

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
