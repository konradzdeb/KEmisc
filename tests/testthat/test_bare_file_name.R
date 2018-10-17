context("Bare file name generation")

test_that(desc = "Bare file name does not contain extension.",
          code = expect_false(grepl(
              x = bare_file_name(x = tempfile(fileext = ".csv")),
              pattern = "csv",
              perl = TRUE
          )))
