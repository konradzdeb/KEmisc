context("Test DeFactorization")

test_that(desc = "Functiona fails on non-factors",
          code = expect_error(
              object = defactorize(x = 1),
              regexp = "Error\\sin\\sassert_class.*"
          ))
