#' @title Show d
#'
#' @param x A data frame or a tibble
#'
#' @return NULL
#'
#' @export
#'
#' @importFrom utils View
#' @examples
#' \dontrun{
#' view_glimpse(mtcars)
#' }
view_glimpse <- function(x) {
    res_dta <- data.frame(column = names(x))
}
