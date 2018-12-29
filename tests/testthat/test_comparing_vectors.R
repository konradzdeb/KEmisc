context("Comparing vectors")

test_that(desc = "Stops if received non-atomic vector",
          code = expect_error(
              object = compare_multiple_vectors(
                  x = list(
                      c(1,2),
                      c(1,3,2),
                      mtcars
                  )
              ),
              regexp = "Must be of type 'atomic vector', not 'data.frame'."
          ))
