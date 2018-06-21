#' @title Preview Table
#'
#' @description The function constructs a data frame from \code{\link[base]{table}}
#'   function and optionally passes results to \code{\link[utils]{View}}
#'   function for easier preview.
#'
#' @param x Vector passed to \code{\link[base]{table}}.
#' @param Show A logical, defaults to \code{\link[base]{TRUE}}, runs
#'    \code{\link[utils]{View}}.
#'
#' @return A data frame.
#'
#' @export
#'
#' @examples
#' preview_table(x = mtcars$am, Show = FALSE)
preview_table <- function(x, Show = TRUE) {
    nm_x <- deparse(substitute(x))
    tbl <- table(x)
    prop_tbl <- prop.table(tbl)
    merge(x = as.data.frame(tbl),
          y = as.data.frame(prop_tbl),
          by = "x") -> res
    setNames(object = res,
             nm = c(nm_x, "no_obs", "frac")) -> res

    if (Show) {
        View(x = res, title = paste("Table:", nm_x))
    }

    return(res)
}
