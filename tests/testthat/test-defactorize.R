context("Test DeFactorization")

test_that(
    desc = "Functiona fails on non-factors",
    code = expect_error(object = defactorize(x = 1),
                        regexp = "Assertion on 'x' failed: Must have class 'factor', but has class*")
)

test_that(
    desc = "Functiona fails on NULL factor",
    code = expect_error(object = defactorize(as.factor(NULL)),
                        regexp = "Assertion on 'x' failed: Contains only missing values.")
)
