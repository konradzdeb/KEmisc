#' Compare Missing Values Across Vectors
#'
#' The function generates a simple data frame outlining a number of missing
#'   values across provided vectors
#'
#' @param ... Vectors to compare.
#' @param add_percentage A logical, defaults to \code{FALSE}. If \code{TRUE} will
#'   add a column with percentage for missing values.
#'
#' @return A tibble
#'
#' @export
#'
#' @examples
#' vecA <- 1:10
#' vecB <- c(1:100, NA_integer_)
#' vecC <- LETTERS
#' compare_missing(vecA, vecB, vecC)
compare_missing <- function(..., add_percentage = FALSE) {
    input_vectors <- list(...)
    vector_names <- paste(as.list(substitute(list(...)))[-1L])
    names(input_vectors) <- vector_names

    purrr::map_dfr(.x = input_vectors,
                   .f = ~ as.data.frame(table(is.na(.x))),
                   .id = "Origin") %>%
        tidyr::pivot_wider(
            names_from = .data$Var1,
            names_glue = "{Var1}_{.value}",
            values_from = .data$Freq,
            values_fill = 0
        ) %>%
        dplyr::rename("Complete" = .data$FALSE_Freq,
                      "Missing" = .data$TRUE_Freq)
}
