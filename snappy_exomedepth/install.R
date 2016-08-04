#!/usr/bin/env Rscript

repos <- "http://cran.ma.imperial.ac.uk"
lib.loc <- "/usr/local/lib/R/site-library"

# BioC
source("http://bioconductor.org/biocLite.R")
biocLite('Biostrings',ask=FALSE)
biocLite('Rsamtools',ask=FALSE)
biocLite('GenomicRanges',ask=FALSE)
biocLite('GenomicAlignments',ask=FALSE)

# CRAN PACKAGES
cranpackages<-c('aod','VGAM','ExomeDepth')
install.packages(cranpackages, lib.loc, repos, dependencies=TRUE)
#install.packages('https://cran.r-project.org/src/contrib/Archive/ExomeDepth/ExomeDepth_1.1.10.tar.gz')
