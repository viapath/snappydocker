#!/usr/bin/env Rscript

repos <- "http://cran.ma.imperial.ac.uk"
lib.loc <- "/usr/local/lib/R/site-library"

# CRAN PACKAGES
cranpackages<-c('ggplot2','gplots','grid','plyr','pracma','reshape2')
install.packages(cranpackages, lib.loc, repos, dependencies=TRUE)
