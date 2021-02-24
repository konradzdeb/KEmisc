test_that("View-glimpse returns a data frame", {
    res <- view_glimpse(mtcars)
    withr::local_options("open_view = FALSE")
    expect_s3_class(res, "data.frame")
})
