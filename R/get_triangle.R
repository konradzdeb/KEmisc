#' @title Get Lower or Upper Triangle of Correlations Matrix
#'
#' @param cormat Usually correlation matrix
#' @param part Single string vector decide whether to return \code{upper} or
#'   \code{lower} part.
#'
#' @details The functions as a wrapper on \code{\link[base]{lower.tri}} and
#'   \code{\link[base]{upper.tri}} functions.
#'
#' @return Object of dimensions \code{dim(cormat)} with \code{NA} values being
#'   present in lower or upper triangle.
#'
#' @export
#'
#' @examples
#' M <- matrix(1:20, 5, 5)
#' get_triangle(cormat = M, part = "upper")
get_triangle <- function(cormat, part = "upper") {
    part <- match.arg(arg = part, choices = c("upper", "lower"))
    switch(part,
           # Get lower traingle
           lower = {
               cormat[upper.tri(cormat)] <- NA
               cormat
           },
           # Get uppertriangle
           upper = {
               cormat[lower.tri(cormat)] <- NA
               cormat
           }) -> corr_triang
    return(corr_triang)
}
