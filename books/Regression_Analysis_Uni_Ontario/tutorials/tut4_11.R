## Regression Tutorial IV

## Q1
USCANmurder <-
structure(list(year = 1979:2009, CANADA = c(2.61, 2.41, 2.61, 
2.66, 2.69, 2.6, 2.72, 2.18, 2.43, 2.15, 2.41, 2.38, 2.69, 2.58, 
2.19, 2.06, 2.01, 2.14, 1.96, 1.85, 1.77, 1.78, 1.78, 1.86, 1.74, 
1.96, 2.06, 1.86, 1.81, 1.84, 1.81), US = c(9.8, 10.2, 9.8, 9.1, 
8.3, 7.9, 8, 8.6, 8.3, 8.4, 8.7, 9.4, 9.8, 9.3, 9.5, 9, 8.2, 
7.4, 6.8, 6.3, 5.7, 5.5, 5.6, 5.6, 5.7, 5.5, 5.6, 5.7, 5.6, 5.4, 
5), ONTARIO = c(2.02, 1.81, 1.93, 2.06, 2.23, 2.07, 2.08, 1.47, 
2.12, 1.89, 1.73, 1.77, 2.35, 2.29, 1.8, 1.77, 1.65, 1.69, 1.59, 
1.37, 1.41, 1.34, 1.43, 1.47, 1.45, 1.51, 1.75, 1.55, 1.58, 1.36, 
1.36), MANITOBA = c(4.24, 3, 3.96, 3.34, 3.77, 4.01, 2.4, 4.31, 
4.01, 2.81, 3.9, 3.53, 3.79, 2.61, 2.77, 2.58, 2.39, 3.97, 2.73, 
2.9, 2.28, 2.61, 2.95, 3.11, 3.69, 4.26, 4.16, 3.29, 5.11, 4.48, 
4.66)), .Names = c("year", "CANADA", "US", "ONTARIO", "MANITOBA"
), row.names = c(NA, -31L), class = "data.frame")

## b
plot(USCANmurder$US,USCANmurder$CANADA)
uscan.lm <- lm(US ~ CANADA, data=USCANmurder)
summary(uscan.lm)

## c
(summary(uscan.lm)$sigma)^2

## d
anova(uscan.lm)

## e
summary(uscan.lm)

## f
predict(uscan.lm,newdata=data.frame(CANADA<-1.62),interval="confidence")

## g
predict(uscan.lm,newdata=data.frame(CANADA<-1.62),interval="prediction")

## Q2
A <- matrix(c(
31, 9, -3, -5, 3,
9, 13, 12, 6, -5,
-3, 12, 17, 12, -3,
-5, 6, 12, 13, 9,
3, -5, -3, 9, 31),
nrow=5, ncol=5,byrow=T)
A <- A/35

B <- matrix(c(1), nrow=5, ncol=5)
B <- B/5

## a
t(A)==A
A %*% A==A
## try another way 
(A*35) %*% (A*35) == (A*35)*35

## b
eigen(A)

## c 
## ka square with freedom as following
sum(diag(A))
sum(diag(diag(5)-A))

## d
A %*% (diag(5)-A)

## e
## Expectation equals the degree of freedom for chi-square distribution

## f
B %*% B ==B
(B*5) %*% (B*5) == (B*5)*5
eigen(B)

## g
A %*% B
## to show that AB=B
(A*35) %*% (B*5) /35/5 ==B

(A-B)%*%(A-B)
A-B

## h
B%*%(A-B)

## i
sum(diag(B))
sum(diag(A-B))
