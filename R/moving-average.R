#' Add Moving Average for an Arbitrary Number of Intervals
#'
#' The functions adds moving average for an arbitrary number of intervals. The
#'   data can be returned sorted or according to the original order.
#'
#' @details The function can be used independently or within dplyr pipeline.
#'
#' @param x A vector used to calculate moving average.
#' @param x_order A vector used for sorting of \code{x} defaults to
#'   \code{sort(x)}.
#' @param interval A number of intervals for moving average, defaults to
#'   \code{round(length(x) / 3, 0)}.
#'
#' @return A vector of length equivalent to \{x} with \code{NA} for
#'   \code{x[1:intervals-1]}.
#'
#' @export
#'
#' @examples
#' moving_average(x = sample(1:100, 10), x_order = 10:1)
moving_average <- function(x, x_order, interval) {
    if (missing(interval)) {
        interval <- round(length(x) / 3, 0)
    }

    if (!missing(x_order)) {
        stopifnot(length(x) == length(x_order))
        x <- x[x_order]
    }

    sapply(seq_along(x), function(i) {
        if (i < interval) {
            NA
        } else {
            sum(x[i:(i - interval)]) / interval
        }
    })

}
