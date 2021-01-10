test_that("Recent file is found", {
    withr::local_tempdir(pattern = "test_fixtures/file_one")
    path_file_two <- withr::local_tempdir(pattern = "test_fixtures/file_two")
    Sys.setFileTime(path_file_two, Sys.time() + 1e6)
    search_res <- most_recent(fs::path_temp("test_fixtures"))
    expect_length(search_res, 1)
    expect_true(grepl("file_two", search_res))
})
