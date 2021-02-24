#' @title Provide glimpse-like results in View
#'
#' @description The function generates \code{\link[tibble]{glimpse}}-like
#'   results that can be shown in \code{\link[utils]{View}}.
#'
#' @details The function will automatically attempt to open the results using
#'   \code{\link[utils]{View}}. If this behaviour is not desired option
#'   \code{show_view} should be set to \code{FALSE} as in
#'   \code{show_view = FALSE}.
#'
#' @param x A data frame or a tibble
#' @param n A number of observations to show
#'
#' @return A data frame similar to \code{\link[tibble]{glimpse}}.
#'
#' @export
#'
#' @examples
#' \dontrun{
#' op <- options()
#' options("open_view = FALSE")
#' view_glimpse(mtcars)
#' }
view_glimpse <- function(x, n = 5) {
    x_cols_names <- colnames(x)
    x_t <- t(utils::head(x, n = n))
    col_nms <- rownames(x_t)
    res_df <- cbind(col_nms, x_t)
    res_df <- stats::setNames(object = as.data.frame(res_df),
             nm = c("column_name", paste0("obs_no_", 2:ncol(res_df))))
    rownames(res_df) <- NULL

    if (isTRUE(getOption("open_view"))) {
        utils::View(res_df)
    }

    res_df
}
