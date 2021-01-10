#' Make Padded Tibble
#'
#' Efficiently combine vectors of unequal lengths into a tibble
#'
#' @details The function is inspired by this answer given on StackOverflow
#'   \url{https://stackoverflow.com/a/7196683/1655567}
#'
#' @param lst A list of vector to combine
#'
#' @return A tibble
#' @export
#'
#' @examples
#' make_padded_tibble(list(vecA = 1:10, vecB = 1:5))
make_padded_tibble <- function(lst) {
    max_length <- max(purrr::map_int(lst, length))
    lst_padded <- purrr::map(lst, ~ .x[1:max_length])
    dplyr::bind_cols(lst_padded)
}
