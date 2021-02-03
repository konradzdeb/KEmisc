test_that("Moving average: basic checks", {
    res <- moving_average(
        mtcars,
        sort_cols = c("am", "cyl"),
        val = gear,
        intervals = 2,
        restore_order = FALSE
    )
    expect_length(res, ncol(mtcars) + 1)
    expect_named(res, expected = append(names(mtcars), "gear_mavg"))
})

test_that("Moving average: data sorting", {
    res <- moving_average(
        mtcars,
        sort_cols = "am",
        val = gear,
        intervals = 2,
        restore_order = TRUE
    )
    expect_identical(mtcars$am, res$am)
})
