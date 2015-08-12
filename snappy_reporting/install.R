#!/usr/bin/env Rscript

repos <- "http://cran.ma.imperial.ac.uk"
lib.loc <- "/usr/local/lib/R/site-library"

# CRAN PACKAGES
cranpackages<-c("knitr","xtable","RSQLite")
install.packages(cranpackages, lib.loc, repos, dependencies=TRUE)
