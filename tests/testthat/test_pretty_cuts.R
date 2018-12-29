context("Formatting cut2 output")


# Only run this test if Hmisc exists
test_that(desc = "Provided string correctly changes set notation",
          code = expect_identical(
              object = pretty_cuts(
                  cut_str = structure(
                      1:5,
                      .Label = c(
                          "[   1,1302)",
                          "[1302,2603)",
                          "[2603,3904)",
                          "[3904,5205)",
                          "[5205,6505]"
                      ),
                      class = "factor"
                  ),
                  only_cuts = TRUE
              ),
              expected = c("1 - 1301",
                           "1302 - 2602",
                           "2603 - 3903",
                           "3904 - 5204",
                           "5205 - 6505")
          ))

test_that(
    desc = "Correct error message is produced on wrong string",
    code = expect_error(object = pretty_cuts(cut_str = "wrong string"),
                        regexp = "Assertion on \\'cut_str\\' failed.*")
)
