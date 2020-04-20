context("Three-way")

test_that("Returns greater value", {
    expect_equal(1 %<=>% 2, 2)
    expect_equal(2 %<=>% 1, 2)
})

test_that("Works on vectors", {
    expect_equal(c(1, 2, 3) %<=>% c(2, 1, 3), c(2, 2, 0))
})

test_that(
    "Displays warning on different types",
    expect_warning(object = "a" %<=>% 1,
                   regexp = "Left\\sand\\sright.*")
)
