#' @title Produce Formatted Unit Without Zero
#'
#' @description Conveniance wrapper on useful \code{\link[scales]{unit_format}}
#'   function offered within \code{scales} package. Useful when producing scales
#'   without 0: \code{"" "1K" "10K"} instead of \code{"0k" "1K" "10K"}.
#'
#' @param x A numeric vector
#' @param ... other arguments passed to \code{\link[scales]{unit_format}}
#'
#' @return A character vector.
#'
#' @export
#'
#' @examples
#' vec_tst <- c(0, 1000, 1e6)
#' units_without_zero(vec_tst, unit = "K", scale = 1e-3, sep = "")
#' # "0"      "1K"     "1,000K"
#' # For comparison
#' scales::unit_format(unit = "K", scale = 1e-3, sep = "")(vec_tst)
#' # [1] "0K"     "1K"     "1,000K"
#'
units_without_zero <- function(x, ...) {
    sf <- scales::unit_format(...)
    f <- function(lbl) {
        if (is.na(lbl)) {
            NA
        } else if (lbl == 0) {
            ""
        } else {
            sf(x = lbl)
        }
    }
    vf <- Vectorize(FUN = f, vectorize.args = c("lbl"))
    return(vf(x))
}
