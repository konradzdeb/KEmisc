#' Save All Objects to RDS Files
#'
#' Iterate over objects available in the designated environment and create a RDS
#'   object for each separate object.
#'
#' @details This a convenience function iterates over objects available within
#'   the designated environment and creates a RDS file for each single item. The
#'   files can have automatically dates added to them.
#'
#' @param env Environment to search for objects. Defaults to
#'   \code{\link[base:parent.frame]{parent_frame(n = 1)}}.
#' @param append_timestamps A boolean, defaults to \code{TRUE} will append
#'   timestamps to each object name.
#' @param output_path Defaults to \code{\link[base]{tempdir}}.
#' @param skip_functions Defaults to \code{TRUE}, removes functions from objects
#'   returned by \code{\link[base]{ls}}.
#' @param ... As in \code{\link[base]{saveRDS}}.
#'
#' @return A character vector of absolute file paths
#'
#' @export
#'
#' @examples
#' a <- 1
#' save_all_objects()
save_all_objects <-
    function(env = parent.frame(n = 1),
             output_path = tempdir(),
             append_timestamps = TRUE,
             skip_functions = TRUE,
             ...) {
        if (skip_functions) {
            available_objects <- setdiff(ls(envir = env), utils::lsf.str(envir = env))
        } else {
            available_objects <- ls(envir = env)
        }

        object_count <- length(available_objects)
        i <- 1

        exported_files <- NULL

        while (object_count != length(exported_files)) {
            object <- get(x = available_objects[i], envir = env)
            if (append_timestamps) {
                time_str <- gsub("\\D", "_", Sys.time())
                rds_file_name <-
                    paste0(available_objects[i], "_", time_str, ".RDS")
            } else {
                rds_file_name <- paste0(available_objects[i], ".RDS")
            }

            export_path <- fs::path(output_path, rds_file_name)
            saveRDS(object = object, file = export_path, ...)
            exported_files <- append(exported_files, export_path)
            i <- i + 1
        }

        exported_files
    }
