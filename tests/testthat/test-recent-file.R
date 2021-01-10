test_that("Recent file is found", {
    withr::local_tempdir(pattern = "file_one")
    withr::local_tempdir(pattern = "file_two")
    search_res <- most_recent(tempdir())
    expect_length(search_res, 1)
    expect_true(grepl("file_two", search_res))
})
