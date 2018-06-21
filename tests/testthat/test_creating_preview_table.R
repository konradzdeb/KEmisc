context("Preview table is generated")

test_that(desc = "Preview table returns a data frame",
          code = expect_is(object = preview_table(mtcars$am, View = FALSE),
                           class = "data.frame"))
