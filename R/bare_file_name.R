#' @title Get Bare File Name
#'
#' @description The function provides bare file name without path and extension.
#'
#' @param x A file path
#'
#' @return A character vector corresponding to file name without path and
#'   extension.
#'
#' @export
#'
#' @examples
#' bare_file_name(tempfile(pattern = "some_file", fileext = ".ext"))
bare_file_name <- function(x) {
    basename(path = tools::file_path_sans_ext(x))
}
