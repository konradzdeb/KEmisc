context("Test creating frequencies table")

test_that(
    desc = "Returned object is a data frame.",
    code = expect_is(object = preview_frequency_table(mtcars$am),
                     class = "matrix")
)
