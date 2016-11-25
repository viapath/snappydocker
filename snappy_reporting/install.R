#!/usr/bin/env Rscript

repos <- "http://cran.ma.imperial.ac.uk"
lib.loc <- "/usr/local/lib/R/site-library"

# CRAN PACKAGES
cranpackages<-c("knitr","xtable","RSQLite","pdftools")
install.packages(cranpackages, lib.loc, repos, dependencies=TRUE)

# BioConductor packges
source("http://bioconductor.org/biocLite.R")
biocLite("Gviz",ask=FALSE)
biocLite('biomaRt',ask=FALSE)
biocLite('GenomicFeatures',ask=FALSE)
biocLite('BSgenome.Hsapiens.UCSC.hg19',ask=FALSE)
