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


test_that(desc = "Correct class is guessedfor a mixed vector (mostly doubles)",
          code = expect_identical(object = guess_vector_type(as.factor(
              sapply(runif(n = 1e4), function(vec_elm) {
                  if (vec_elm >= 0.8) {
                      sample(x = letters, size = 1)
                  } else {
                      vec_elm
                  }
              })
          )),
          expected = "double"))



test_that(desc = "Correct class is guessedfor a mixed vector (mostly integers)",
          code = expect_identical(object = guess_vector_type(as.factor(
              sapply(runif(n = 1e4), function(vec_elm) {
                  if (vec_elm >= 0.2) {
                      sample(x = 1:1e3, size = 1)
                  } else {
                      vec_elm
                  }
              })
          )),
          expected = "integer"))

