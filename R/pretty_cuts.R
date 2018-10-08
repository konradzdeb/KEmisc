# Pretty cuts
#' @title Pretty Cuts
#'
#' @description Function removing set notation used by \code{\link[base]{cut}}
#'   or by \code{\link[Hmisc]{cut2}}.
#'
#' @details For a vector with sets \code{(2e+03,4e+03]}
#'   \code{pretty_cuts} will return  \code{"2.01 - 3"}.
#'
#' @param cut_str A character or factorvector produced by \code{\link[base]{cut}}
#'   or by \code{\link[Hmisc]{cut2}} or a similar function.
#'
#' @return A character vector.
#' @export
#'
#' @examples
#' set.seed(123)
#' pretty_cuts(cut(x = runif(n = 1e3, min = 1, 1e4), breaks = 5))
#'
pretty_cuts <- function(cut_str) {
    # so we know when to not do something
    first_val <-
        as.numeric(stringr::str_extract_all(cut_str[1], "[[:digit:]\\.]+")[[1]][1])
    last_val <-
        as.numeric(stringr::str_extract_all(cut_str[length(cut_str)], "[[:digit:]\\.]+")[[1]][2])

    sapply(seq_along(cut_str), function(i) {
        # get cut range
        x <- stringr::str_extract_all(cut_str[i], "[[:digit:]\\.]+")[[1]]

        # see if a double vs an int & get # of places if decimal so
        # we know how much to inc/dec
        inc_dec <- 1
        if (stringr::str_detect(x[1], "\\.")) {
            x <- as.numeric(x)
            inc_dec <- 10 ^ (-match(TRUE, round(x[1], 1:20) == x[1]))
        } else {
            x <- as.numeric(x)
        }

        # if not the edge cases inc & dec
        if (x[1] != first_val) {
            x[1] <- x[1] + inc_dec
        }
        if (x[2] != last_val)  {
            x[2] <- x[2] - inc_dec
        }

        sprintf("%s - %s", as.character(x[1]), as.character(x[2]))

    })

}
