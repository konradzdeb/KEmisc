test_that("Tibble is created", {
  res_tbl <- make_padded_tibble(list(vecA = 1:10, vecB = 1:5))
  expect_length(res_tbl, 2)
  expect_s3_class(res_tbl, "tbl_df")
  expect_named(res_tbl, c("vecA", "vecB"))
})
