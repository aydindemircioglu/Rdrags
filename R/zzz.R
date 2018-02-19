#!/usr/bin/Rscript  --vanilla


# create own environment
RdragsEnv = new.env(parent = emptyenv())


.onLoad <- function(libname, pkgname) {
	op <- options()
	op.devtools <- list(
		devtools.path = "~/R-dev",
		devtools.install.args = "",
		devtools.name = "Aydin Demircioglu",
		devtools.desc.author = '"Aydin Demircioglu <aydin.demircioglu@ini.rub.de> [aut, cre]"',
		devtools.desc.license = "LGPL-3 + file LICENSE",
		devtools.desc.suggests = NULL,
		devtools.desc = list()
	)
	toset <- !(names(op.devtools) %in% names(op))
	if(any(toset)) options(op.devtools[toset])

	#  find_rtools()

	invisible()
}


.onAttach <- function (libname, pkgname) {
	packageStartupMessage("Rdrags loaded.")
}


.onUnload <- function (libpath) {
}
