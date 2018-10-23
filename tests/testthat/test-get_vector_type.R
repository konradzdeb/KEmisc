context("Guessing factor content")

test_that(desc = "Factor with letters only has mostly characters.",
          code = expect_identical(object = guess_vector_type(x = as.factor(letters))))
