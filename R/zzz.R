.onLoad <- function(libname, pkgname) {
    backports::import(pkgname, c("isFALSE"))

    # As provided in dplyr
    op <- options()
    op.KEmisc <- list(
        "show_view = TRUE"
    )
    toset <- !(names(op.KEmisc) %in% names(op))
    if (any(toset)) {
        options(op.KEmisc[toset])
    }
}
