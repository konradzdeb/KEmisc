#' @title Read RDS Ffile Directly to Global Environment
#'
#' @description
#'
#' @param file_path
#' @param verbose A logica, if \code{TRUE}
#'
#' @return A R object corresponding to \code{basename} on \code{file_path}
#'   argument.
#'
#' @export
#'
#' @examples
#' \dontrun{
#'   tmpCars <- tempfile(pattern = "mtcars_", fileext = ".RDS")
#'   saveRDS(object = mtcars, file = tmpCars)
#'   read_RDS_to_global(tmpCars)
#' }
#'
read_RDS_to_global <- function(file_path, verbose = TRUE) {
    readRDS(file = file_path) -> dta
    base_name <- basename(tools::file_path_sans_ext(file_path))
    assign(x = base_name,
           value = dta,
           envir = globalenv())
    if (verbose) {
        if (checkmate::allMissing(setdiff(base_name, ls(envir = globalenv())))) {
            cat("Created object:",
                base_name,
                "in global environment.")
        }
    }
}
