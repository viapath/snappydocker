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
cranpackages<-c('ExomeDepth')
install.packages(cranpackages, lib.loc, repos, dependencies=TRUE)
