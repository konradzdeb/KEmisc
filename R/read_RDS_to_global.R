read_RDS_to_global <- function(file_path, verbose = TRUE) {
    readRDS(file = file_path) -> dta
    base_name <- basename(tools::file_path_sans_ext(file_path))
    assign(x = base_name,
           value = dta,
           envir = globalenv())
    if (verbose) {
        if (checkmate::allMissing(setdiff(base_name, ls(envir = globalenv())))) {
            cat(crayon::green(
                "Created object:",
                base_name,
                "in global environment."
            ))
        }
    }
}
