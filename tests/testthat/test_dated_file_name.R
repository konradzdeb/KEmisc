context("Dated file name")

test_that(
    desc = "File name has name string",
    code = expect_match(
        object = create_dated_file_name(x = "some_name"),
        regexp = "^some_name.*",
        perl = TRUE
    )
)

test_that(
    desc = "File name has extension",
    code = expect_match(
        object = create_dated_file_name(x = "some_name", extension = ".RDS"),
        regexp = ".*RDS$",
        perl = TRUE
    )
)

test_that(
    desc = "File name contains date digits",
    code = expect_match(
        object = create_dated_file_name(
            x = "some_name",
            extension = ".RDS",
            timestamp_format = "%Y"
        ),
        regexp = ".*\\d{4}\\.RDS$",
        perl = TRUE
    )
)
