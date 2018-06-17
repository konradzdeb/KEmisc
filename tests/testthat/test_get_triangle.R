context("Getting matrix upper or lower part")

test_that(desc = "Returned object is a matrix",
          code = expect_is(
              object = get_triangle(cormat = matrix(1:20, 5, 5), part = "upper"),
              class = "matrix"
          ))
