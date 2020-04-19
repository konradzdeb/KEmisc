context("Three-way")

test_that("Returns greater value", {
    expect_equal(1 %<=>% 2, 2)
    expect_equal(2 %<=>% 1, 2)
})

test_that("Works on vectors", {
    expect_equal(c(1, 2, 3) %<=>% c(2, 1, 3), c(2, 2, 0))
})
