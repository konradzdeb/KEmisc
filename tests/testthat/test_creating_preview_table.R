context("Preview data frame is generated")

test_that(desc = "Preview table returns a data frame",
          code = expect_is(object = preview_table(mtcars$am, Show = FALSE),
                           class = "data.frame"))

test_that(
    desc = "Generated object is of desired size",
    code = checkmate::expect_data_frame(
        x = preview_table(x = mtcars$am, Show = FALSE),
        nrows = 2,
        ncols = 3,
        any.missing = FALSE,
        null.ok = FALSE
    )
)
