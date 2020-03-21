library(tmle)
set.seed(1)
n <- 250
W <- matrix(rnorm(n*3), ncol=3)
A <- rbinom(n,1, 1/(1+exp(-(.2*W[,1] - .1*W[,2] + .4*W[,3]))))
Y <- A + 2*W[,1] + W[,3] + W[,2]^2 + rnorm(n)
# Example 1. Simplest function invocation
# SuperLearner called to estimate Q, g
# Delta defaults to 1 for all observations
result1 <- tmle(Y,A,W)
summary(result1)

z <- rbinom(100,5,0.3)
z2 <- ifelse(z>2,"A","B")
