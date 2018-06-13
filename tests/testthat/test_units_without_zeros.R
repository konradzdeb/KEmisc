context("Generating units with no zero")

test_that(desc = "Correct vector is generated.",
          code = expect_identical(
              object = units_without_zero(
                  x = c(0, 1000, 1e6),
                  scale = 1e-3,
                  unit = "K",
                  sep = ""
              ),
              expected = c("", "1K", "1,000K")
          ))
