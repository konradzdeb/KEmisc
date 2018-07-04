#' @title Create Dated File/Path Name
#'
#' @description This is trival function that wraps \code{\link[base]{paste}}
#'   call and prduces a string with \code{\link[base]{Sys.time}} results.
#'
#' @param x A character vector.
#' @param timestamp_format A string scalar.
#' @param sep A string scalar.
#'
#' @return A character vector of length corresponding to x.
#'
#' @export
#'
#' @examples
create_dated_file_name <- function(x,
                                   timestamp_format = "%d-%m-%Y",
                                   sep = "-") {
    # Arguments check
    checkmate::checkScalar(x = timestamp_format,
                           na.ok = FALSE,
                           null.ok = FALSE)
    checkmate::checkScalar(x = sep,
                           na.ok = TRUE,
                           null.ok = TRUE)
    checkmate::check_character(
        x = x,
        min.chars = 1,
        min.len = 1,
        all.missing = FALSE
    )

    # Generate file name
    paste(x,
          format(Sys.time(), timestamp_format),
          sep = sep)

}
