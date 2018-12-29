context("Comparing vectors")

test_that(
    desc = "Stops if received non-atomic vector",
    code = expect_error(object = compare_multiple_vectors(x = list(
        c(1, 2),
        c(1, 3, 2),
        mtcars
    )),
    regexp = "Must be of type 'atomic vector', not 'data.frame'.")
)


test_that(desc = "Three identical vectors return TRUE",
          code = expect_true(object = compare_multiple_vectors(x = list(
              c(1, 2, 3),
              c(1, 2, 3),
              c(1, 2, 3)
          ))))

test_that(desc = "False is returned if vectors differ",
          code = expect_false(object = compare_multiple_vectors(x = list(
              c(1, 2, 3),
              runif(n = 10)
          ))))

test_that(desc = "Comparing more than three identical vectors",
          code = expect_true(object = compare_multiple_vectors(x = list(
              rep(runif(n = 10), tmes = 1e3)
          ))))

test_that(desc = "Comparing more than three different vectors",
          code = expect_false(object = compare_multiple_vectors(x = list(
              rep(runif(n = 10), tmes = 1e3), 2
          ))))

