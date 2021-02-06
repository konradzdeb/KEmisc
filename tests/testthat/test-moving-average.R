test_that("Moving average: basic checks", {
    sample_vec <- c(87, 99, 46, 40, 33, 94, 18, 60, 63, 6)
    res <- moving_average(sample_vec)
    expect_equal(
        object = res,
        expected = c(NA, NA, 70.3, 61.6, 39.6, 55.6, 48.3, 57.3, 47, 43),
        tolerance = 0.5
    )
})
