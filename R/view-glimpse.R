#' @title Provide glimpse-like results in View
#'
#' @param x A data frame or a tibble
#' @param n A number of observations to show
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
view_glimpse <- function(x, n = 5) {
    x_cols_names <- colnames(x)
    x_t <- t(head(x, n = n))
    col_nms <- rownames(x_t)
    res_df <- cbind(col_nms, x_t)
    res_df <- setNames(object = as.data.frame(res_df),
             nm = c("column_name", paste0("obs_no_", 2:ncol(res_df))))
    rownames(res_df) <- NULL
    res_df
}
