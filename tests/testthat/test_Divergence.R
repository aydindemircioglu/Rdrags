library (simanle)
context ("Divergence test")	


test_that("our wrapper gives the same output as LASVM called by command line", {
    mu1 = runif(6)
    mu2 = runif(6)

    A = runif(6*6)
    S1 = matrix(A, c(6,6)) + diag(6)
    A = runif(6*6)
    S2 = matrix(A, c(6,6)) + diag(6)

    S1 = S1 + t(S1)
    S2 = S2 + t(S2)
    S1 = S1 %*% S1
    S2 = S2 %*% S2


    jDiv = jeffreyDivergence (mu1, S1, mu2, S2)
    cat("Jeffrey Divergence: ", jDiv)

    bDiv = bhattacharyyaDivergence (mu1, S1, mu2, S2)
    cat("Bhattacharyya Divergence: ", bDiv)

    hDiv = hellingerDivergence (mu1, S1, mu2, S2)
    cat("Hellinger Divergence: ", hDiv)

    jDiv = jeffreyRiemannDivergence (mu1, S1, mu2, S2)
    cat("Jeffrey-R Divergence: ", jDiv)

    jDiv = bhattacharyyaRiemannDivergence (mu1, S1, mu2, S2)
    cat("Bhattacharyya-R Divergence: ", jDiv)
})


