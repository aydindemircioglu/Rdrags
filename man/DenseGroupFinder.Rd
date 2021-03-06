% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/DenseGroupFinder.R
\name{DenseGroupFinder}
\alias{DenseGroupFinder}
\title{Dense Group Finder}
\usage{
DenseGroupFinder(data, k = 3, h = 0, useKNN = TRUE, lambda = 0,
  maxIter = 100, eps = 1e-05, kernelType = "gaussian")
}
\arguments{
\item{data}{Data to process}

\item{k}{Neighborhood size, in case useKNN is TRUE.}

\item{h}{Bandwidth}

\item{useKNN}{Should k-NN be used to determine the mean distance h?}

\item{lambda}{Lambda, only used when KernelType is flat}

\item{maxIter}{Maximum number of iterations}

\item{eps}{Stopping criterion for convergence.}

\item{kernelType}{Type of the kernel to be used, either "gaussian" or "flat"}
}
\value{
List of groups of (index of) features that are closely related.
}
\description{
Dense Group Finder
}
\examples{

}
