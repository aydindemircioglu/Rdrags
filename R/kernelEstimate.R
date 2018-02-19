
#' Kernel Estimate
#'
#' @param   x1      First data point
#' @param   x2      Second data point
#' @param   h       Bandwidth
#' @param   lambda  Lambda, only used when KernelType is flat
#' @param   KernelType  Type of the kernel to be used, either "gaussian" or "flat"
#' @return  Kernel value.
#' @examples
#'

kernelEstimate = function (x1, x2, h, lambda, kernelType) {
    # TODO: check for same length

    # TODO: x1 should have only one element

    # could be done faster maybe
    d = dist(rbind(x1, x2))
    pd = as.matrix(dist(d))[1,]
    if (kernelType == "flat") {
        return (as.numeric(pd <= lambda)[-1])
    }

    if (kernelType == "gaussian") {
        return (exp(-1/2*pd^2/h^2)[-1])
    }

    stop ("Internal Error: Unknown kernel type selected. This should have been signaled long before this.")
}
