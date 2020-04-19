test_that("Returns greater value", {
  expect_equal(1 %<=>% 2, 2)
  expect_equal(2 %<=>% 1, 2)
})
