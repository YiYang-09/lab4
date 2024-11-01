data("iris")
library(MASS)

test_that("ridgereg produces similar coefficients to lm.ridge", {
  formula <- Petal.Length ~ Species
  lambda <- 1
  

  ridgereg_result <- ridgereg(formula, data = iris, lambda = lambda)
  lm_ridge_result <- lm.ridge(formula, data = iris, lambda = lambda)
  

  ridgereg_coef <- as.numeric(ridgereg_result$coefficients)
  lm_ridge_coef <- as.numeric(coef(lm_ridge_result))
  
  expect_equal(ridgereg_coef, lm_ridge_coef, tolerance = 1e-1)
})