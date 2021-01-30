#' Compare Three Vectors
#'
#' @description Convenience function comparing three elements using a desired
#'   comparator function.
#'
#' @details The results of the comparator function are tested with
#'
#' @param x,y,z Vectors of equal length to compare
#' @param compare_fun A function used to compare defaults to
#'   \code{\link[base]{identical}}.
#' @param result For \emph{single} it will return logical scalar \code{TRUE} if
#'   all arguments are identical; for \emph{itemized} it will return vector of
#'   length equal to lengths of passed arguments. Defaults to \emph{single}.
#'
#' @return A logical vector of length equal to \code{a, b, c}
#' @export
#'
#' @examples
#' compare_three(1:10, 1:10, 1:10)
#' compare_three(c("b", "a"), c("b", "b"), c("b", "c"), result = "itemized")
compare_three <-
    function(x,
             y,
             z,
             compare_fun =  "identical",
             result = c("single", "itemized")) {



        f_comparator <- match.fun(compare_fun)
        if (missing(result)) {
            result <- "single"
        } else {
            result <- match.arg(result)
        }

        f_compare <- function(x, y, z) {
            if (isTRUE(do.call(f_comparator, list(x, y)))) {
                if (isTRUE(do.call(f_comparator, list(y, z)))) {
                    return(TRUE)
                } else {
                    return(FALSE)
                }
            } else {
                return(FALSE)
            }
        }

        res <- purrr::pmap_lgl(.l = list(x, y, z), .f = f_compare)

        if (result == "single") {
            return(all(res))
        } else {
            return(res)
        }

    }
