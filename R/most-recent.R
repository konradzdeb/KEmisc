#' Find most recent file or folder
#'
#' Searches path provided in the \code{search_path} and returns most recent file
#'   or directory.
#'
#' @details The function makes use of the directory listing function available
#'   in the \code{fs} package - \code{\link[fs:dir_ls]{fs::dir_ls}} and
#'   consequently can return any objects that
#'   \code{\link[fs:dir_ls]{fs::dir_ls}} can identify.
#'
#' @param search_path A path to search
#' @param type Type of an object to return. Defaults to \code{any}, available
#'   options correspond to \code{type} argument in
#'   \code{\link[fs:dir_ls]{fs::dir_ls}}.
#'
#' @return A \code{\link[fs]{path}} object.
#' @export
#'
#' @examples
#' most_recent(tempdir())
most_recent <-
    function(search_path,
             type = c("any", "file", "directory", "symlink")) {
        if (rlang::is_missing(type)) {
            type <- "any"
        } else {
            type <- rlang::arg_match(type)
        }

        res_objs <- fs::dir_ls(path = search_path, type = type)
        res_objs_info <- fs::file_info(res_objs)

        res_objs[which.max(res_objs_info$modification_time)]
    }
