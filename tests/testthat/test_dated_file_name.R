context("Test dated file name creation")

test_that(
    desc = "Created file name is a string",
    code = checkmate::expect_string(
        x = create_dated_file_name(x = "file_name"),
        na.ok = FALSE,
        min.chars = 9,
        null.ok = FALSE
    )
)
