#' @title Preview Frequency Tables
#'
#' @description Simplefunction showing frequencies of vector by combining
#'   results from \code{\link[base]{table}} and \code{\link[base]{prop.table}}.
#'
#' @param x A vector.
#' @param ... Other arguments passed to \code{\link[base]{table}}.
#'
#' @return A matrix with frequency values of a vector
#' @export
#'
#' @examples
#' preview_frequency_table(x = c("a", rep("b", 3)))
#'
preview_frequency_table <- function(x, ...) {
    # Check if passed value is a vector
    if (requireNamespace("checkmate", quietly = TRUE)) {
        checkmate::test_vector(
            x = x,
            strict = FALSE,
            any.missing = TRUE,
            all.missing = FALSE,
            min.len = 1,
            null.ok = TRUE
        )
    }

    tbl <- table(x, ...)
    prop_tbl <- prop.table(tbl)

    # Result data frame
    dta <- cbind(tbl, prop_tbl)

    # Fix names
    colnames(dta) <- c("num_obs", "freq")

    # Return final data
    return(dta)
}
