#' Add Moving Average for an Arbitrary Number of Intervals
#'
#' The functions adds moving average for an arbitrary number of intervals. The
#'   data can be returned sorted or according to the original order.
#'
#' @details The function can be used independently or within dplyr pipeline.
#'
#' @param .data A tibble or data frame.
#' @param sort_cols Columns used for sorting passed in a manner consistent with
#'   \code{\link[dplyr]{arrange}}
#' @param val Column used to calculate moving average passed as bare column
#'   name or a character string.
#' @param intervals A number of intervals for moving average.
#' @param res_val Resulting moving average, defaults to name of \code{val}
#'   suffixed with \code{_mavg}.
#' @param restore_order A logical, defaults to \code{FALSE} if \code{TRUE} it
#'   will restore original data order.
#'
#' @return A tibble with appended moving average.
#'
#' @importFrom rlang :=
#'
#' @export
#'
#' @examples
#' add_moving_average(mtcars, sort_cols = c("mpg", "cyl"), val = hp, intervals = 2)
add_moving_average <-
    function(.data,
             sort_cols,
             val,
             intervals = 2,
             res_val = "{{val}}_mavg",
             restore_order = FALSE) {

        unique_id_name <- utils::tail(make.unique(c(colnames(.data), "ID")), 1)
        data_w_index <- dplyr::mutate(.data, {{unique_id_name}} := dplyr::row_number())

        index_col_name <- utils::tail(names(data_w_index), 1)

        # Create desired number of calls to get moving average calculation
        lag_calls <- paste0("lag(",  rlang::as_string(rlang::ensym(val)), ", ", 1:intervals, ")")
        lag_call <- paste(lag_calls, collapse = " + ")
        lag_call <- paste0("(", lag_call, ") / ", intervals)

        data_sorted <- dplyr::arrange(data_w_index, dplyr::across(sort_cols))

        data_avg <- dplyr::mutate(data_sorted,"{{val}}_mavg" := !!rlang::parse_expr(lag_call))

        if (res_val != "{{val}}_mavg") {
            data_avg <- dplyr::rename(data_avg, res_val = "{{val}}_mavg")
        }

        if (restore_order) {
            data_avg <- dplyr::arrange(data_avg, !!rlang::sym(index_col_name))
        }

        data_avg <- dplyr::select(data_avg, -dplyr::last_col(1))
        data_avg
    }
