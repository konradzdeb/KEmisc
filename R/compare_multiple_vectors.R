#' @title Compare Values of Multiple Vectors
#'
#' @description The function compares values across multiple vectors using
#'   \code{\link[base]{all.equal}}.
#'
#' @param x Alist of vectors to compare
#' @param ... as in  \code{\link[base]{all.equal}}
#'
#' @return A logical
#'
#' @export
#'
#' @importFrom checkmate assert_atomic_vector
#'
#' @examples
#' # Returns TRUE
#' compare_multiple_vectors(c(1,1,1), c(1,1,1))
#' # Returns FALSE
#' compare_multiple_vectors(c(1,1,1), c(1,1,1), c(1,2,1))
#' # Returns FALSE
#' compare_multiple_vectors(c(1,2,3), c(3,2,1))
compare_multiple_vectors <- function(x, ...) {
    # Check if all elements of x are atomic vectors
    Vectorize(FUN = checkmate::assert_atomic_vector,
              vectorize.args = "x")(x)

    # Compare list elements
    Reduce(
        f = function(a, b, ...) {
            if (isTRUE(all.equal(target = a, current = b, ...))) {
                a
            } else {
                FALSE
            }
        },
        x = x
    ) -> res_red

    # Return results
    if (isFALSE(res_red)) {
        return(FALSE)
    } else {
        return(TRUE)
    }
}
