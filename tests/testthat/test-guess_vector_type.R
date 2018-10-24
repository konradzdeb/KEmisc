context("Guessing factor content")

test_that(
    desc = "Factor with letters has returns character class",
    code = expect_identical(object = guess_vector_type(x = as.factor(letters)),
                            expected = "character")
)

test_that(desc = "Double is returned for factor generated via runinf",
          code = expect_identical(object = guess_vector_type(x = as.factor(runif(
              n = 1e3
          ))),
          expected = "double"))

test_that(desc = "Integer is returned for factor with integers",
          code = expect_identical(object = guess_vector_type(x = as.factor(round(
              runif(min = -1e4, max = 1e4, n = 1e3), 0
          ))),
          expected = "integer"))
