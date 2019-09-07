#' @title Create Dated File/Path Name
#'
#' @description This is trivial function wraps \code{\link[base]{paste}}
#'   call and produces a string with \code{\link[base]{Sys.time}} and an
#'   optional extension.
#'
#' @details This simple function is convenient for automatically generating
#'   file names with the current date and/or time.
#'
#' @param x A character vector.
#' @param timestamp_format A string scalar for time format, as in
#'   \code{\link[base]{strptime}}.
#' @param sep A string scalar to separate file name parts.
#' @param extension A string scalar with file type extension.
#'
#' @return A character vector of length corresponding to x.
#'
#' @export
#'
#' @importFrom checkmate assertScalar
#' @importFrom checkmate assert_character
#'
#' @examples
#' create_dated_file_name(x = "file_name")
#' create_dated_file_name(x = "annual_file", timestamp_format = "%Y")
#' create_dated_file_name(x = "time_file", timestamp_format = "%H:%M:%S")
create_dated_file_name <- function(x,
                                   timestamp_format = "%d-%m-%Y",
                                   sep = "-",
                                   extension) {
    # Arguments check
    mapply(
        FUN = assertScalar,
        x = list(timestamp_format, sep),
        MoreArgs = list(na.ok = FALSE,
                        null.ok = FALSE),
        SIMPLIFY = FALSE
    )

    assert_character(
        x = x,
        min.chars = 1,
        min.len = 1,
        all.missing = FALSE
    )

    # Generate file name
    paste(x,
          format(Sys.time(), timestamp_format),
          sep = sep) -> file_name

    # Conditionally add extension
    if (!missing(extension)) {
        # Check validity of provided extension argument
        assertScalar(x = extension,
                     na.ok = FALSE,
                     null.ok = FALSE)
        # Add to file name
        file_name <- paste0(file_name, extension)
    }

    return(file_name)

}
