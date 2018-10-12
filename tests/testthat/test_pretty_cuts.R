context("Test formatting cut2 output")

test_that(desc = "Provided string correctly changes set nottion",
          code = expect_identical(
              object = pretty_cuts(cut_str = Hmisc::cut2(1:6505, g = 5),
                                   only_cuts = TRUE),
              expected = c("1 - 1301", "1302 - 2602", "2603 - 3903", "3904 - 5204", "5205 - 6505")
          )
