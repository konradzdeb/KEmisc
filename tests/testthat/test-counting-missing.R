context("Missing values in vectors")

test_that("Returns desired object", {
    some_vector <- runif(n = 1e3)
    other_vector <-
        sample(c(1:10, NA_integer_), 1e3, replace = TRUE)
    messy_vector <-
        sample(c(seq.Date(
            from = Sys.Date() - 10,
            to = Sys.Date(),
            by = "day"
        ), NA), 1e3, replace = TRUE)

    res <-
        compare_missing(some_vector, other_vector, messy_vector, add_percentage = TRUE)

    expect_s3_class(res, class = "data.frame")
    expect_length(res, n = 3)
    expect_named(res)
})
