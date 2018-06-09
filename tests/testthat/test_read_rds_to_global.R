context("Test read_RDS_to_global")

test_that(desc = "Object is created in global environment",
          code = expect_true(object = {
              temp_RDS_file <-
                  tempfile(pattern = "temp_mtcars_file", fileext = ".RDS")
              saveRDS(object = mtcars, file = temp_RDS_file)
              read_RDS_to_global(file_path = temp_RDS_file)
              exists(x = tools::file_path_sans_ext(basename(temp_RDS_file)),
                     where = globalenv())
          }))

test_that(desc = "Vebose = TRUE prints out message",
          code = expect_message(object = {
              temp_RDS_file <-
                  tempfile(pattern = "temp_mtcars_file", fileext = ".RDS")
              saveRDS(object = mtcars, file = temp_RDS_file)
              read_RDS_to_global(file_path = temp_RDS_file)
              exists(x = tools::file_path_sans_ext(basename(temp_RDS_file)),
                     where = globalenv())
          },
          regexp = "Created\\sobject.*"))
