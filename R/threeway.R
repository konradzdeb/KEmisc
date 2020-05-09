#' @title Three-way operator
#'
#' @description A three-way comparison takes two values A and B determines
#'   whether A < B, A = B, or A > B in a single operation.
#'
#' @param lhs Left hand side operator
#' @param rhs Rand hand side operator
#'
#' @return Greater value or zero if equal.
#'
#' @export
#'
#' @examples
#' 1 %<=>% 2
#' 2 %<=>% 1
#' 3 %<=>% 3
`%<=>%` <- function(lhs, rhs) {
    if (typeof(lhs) != typeof(rhs)) {
        warning("Left and right hand operators are not of identical types.")
    }

    # Single comparison function
    f_check <- function(lhs, rhs) {
        if (lhs > rhs) {
            lhs
        } else if (lhs < rhs) {
            rhs
        } else if (lhs == rhs) {
            0
        }
    }

    # Run on each element of vector
    withCallingHandlers(
        expr = purrr::modify2(.x = lhs, .y = rhs, .f = f_check),
        error = function(e) {
            "Compared vectors should be of equal lengths"
        }
    )
}
