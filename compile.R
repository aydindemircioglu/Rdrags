#!/usr/bin/Rscript  --vanilla

library(methods)
library(devtools)

load_all (".")
build_vignettes(".")
document(".")
