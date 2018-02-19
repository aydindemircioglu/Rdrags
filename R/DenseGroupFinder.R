
#' Dense Group Finder
#'
#' @param   data    Data to process
#' @param   h       Bandwidth
#' @param   lambda  Lambda, only used when KernelType is flat
#' @param   maxIter Maximum number of iterations
#' @param   eps     Stopping criterion for convergence.
#' @param   KernelType  Type of the kernel to be used, either "gaussian" or "flat"
#' @return  List of groups of (index of) features that are closely related.
#' @examples
#'
#' @export

DenseGroupFinder = function (data, k = 3, h = 0, useKNN = TRUE, lambda = 0.0, maxIter = 100, eps = 1e-5, kernelType = "gaussian") {

    addRow = function (t, r) {
        if (is.null (t) == TRUE) {
            t = r
        } else {
            t = rbind (t, r)
        }
        return (t)
    }

    # assume data is n x d, so all works in d-dim space
    # and each data point corresponds to a row
    n = nrow(data)
    d = ncol(data)

    # use KNN? then recompute h
    if (useKNN == TRUE) {
        knnObj = FNN::get.knn (data, k)
        h = mean(rowMeans(knnObj$nn.dist)) # simple mean(..) would do it too, but well.
	}

    # output
    peaks = NULL
    denseGroups = NULL

    # main loop
    for (i in seq(1,n)) {
        yOld = data[i, ]

        # Iterate until convergence
        diff = 2*eps
        j = 0
        while ((diff > eps) && (j < maxIter)) {
            # compute next shift
			kernelValues = kernelEstimate(yOld, data, h = h, lambda = lambda, kernelType = kernelType) #ndim
			kernelSum = sum(kernelValues)
            yNew = colSums(as.matrix(data) %*% diag(kernelValues))/kernelSum

            # convergence?
			diff = get.knn(rbind(yNew, yOld), k=k)$nn.dist[1]
			yOld = yNew
			j = j+1
        }

        # compute distances to peaks
        pd = dist (yOld, peaks)
        minIndex = as.numeric(which.min(as.matrix(dist(cbind(pd,1)))[1,-1]))
        minDist = min(as.matrix(dist(cbind(pd,1)))[1,-1]) #cbind correct?

        # create either a new peak or merge with existing peak
		if ((minIndex >= 0) && (minDist < h)) {
            peaks [minIndex,] = (peaks[minIndex,] + yOld)/2.0
		} else {
            peaks = addRow (peaks, yOld)
		}
	}

	# For each unique peak, group all the features with distance < h
    denseGroups = list()
    for (j in ncol(peaks)) {
        # dist of jth peaks to all data points
        d = as.matrix(dist (rbind (peaks[j,], data)))[1,][-1]
        denseGroups = c(denseGroups, list(which(d<h)))
	}

    # remove empty groups
    denseGroups = Filter (length, denseGroups)
	return (denseGroups)
}
