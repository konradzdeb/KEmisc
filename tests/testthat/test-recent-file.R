test_that("Recent file is found", {
    withr::local_tempdir(pattern = "test_fixtures/file_one")
    withr::local_tempdir(pattern = "test_fixtures/file_two")
    search_res <- most_recent(fs::path_temp("test_fixtures"))
    expect_length(search_res, 1)
    expect_true(grepl("file_two", search_res))
})
