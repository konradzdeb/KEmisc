#' @title Compare Values of Multiple Vectors
#'
#' @param ...
#'
#' @return A logical
#'
#' @export
#'
#' @examples
#' # Returns TRUE
#' compare_multiple_vectors(c(1,1,1), c(1,1,1))
#' # Returns FALSE
#' compare_multiple_vectors(c(1,1,1), c(1,1,1), c(1,2,1))
compare_multiple_vectors <- function(...) {
    x <- list(...)
}
