context("Comparing three vectors")

test_that("Identifies if identical", {
    expect_true(compare_three(1:10, 1:10, 1:10))
    expect_false(compare_three(c("a", "a"), c("a", "a"), c("a", "b")))
    expect_length(compare_three(c("a", "a"), c("a", "a"), c("a", "b"), result = "itemized"), 2)
})

test_that("Fails on different length", {
    expect_error(compare_three(1:10, 1:10, 1:100),
                 regexp = ".*must\\shave\\slength.*")
})
