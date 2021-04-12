test_that("Saves files as expected", {
    generated_files <- withr::with_tempdir({
        a <- 1
        b <- "c"
        save_all_objects()
    })
    expect_equal(object = length(generated_files), expected = 2)
    expect_true(any(file.exists(generated_files)))
    expect_identical(readRDS(generated_files[1]), 1)
    expect_identical(readRDS(generated_files[2]), "c")
})
