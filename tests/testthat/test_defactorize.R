context("Test DeFactorization")

test_that(
    desc = "Functiona fails on non-factors",
    code = expect_error(object = defactorize(x = 1),
                        regexp = "Assertion on 'x' failed: Must.*")
)

test_that(
    desc = "Functiona fails on NULL factor",
    code = expect_error(object = defactorize(as.factor(NULL)),
                        regexp = "Assertion on 'x' failed: Contains only missing values.")
)

test_that(desc = "Function returns a character vector",
          code = expect_is(object = defactorize(x = as.factor(c(
              letters, 1:5
          ))),
          class = "character"))

test_that(desc = "Function returns an integer vector",
          code = expect_is(object = defactorize(x = as.factor(c(
              letters, 1:1e4
          ))),
          class = "integer"))

test_that(desc = "Function returns anumeric 'double' vector ",
          code = expect_is(object = defactorize(x = as.factor(c(
              letters, runif(n = 1e4)
          ))),
          class = "numeric"))
