context("Pretty cuts transforms the cut/cut2 output")

test_that(desc = "Produced vectors matches example",
          code = expect_identical(
              object = unique(pretty_cuts(cut_str = cut(
                  x = {
                      # If .Random.seed does not exist create
                      if (!exists(".Random.seed")) {
                          runif(n = 10)
                      }
                      # Set seed locally
                      # follows: https://stackoverflow.com/a/14324316/1655567
                      old <- .Random.seed
                      on.exit({
                          .Random.seed <<- old
                      })
                      set.seed(123)
                      runif(n = 1e3, min = 1, max = 100)
                  }, breaks = 5
              ))),
              expected = c(
                  "20.8 - 40.5",
                  "60.5 - 80.1",
                  "40.7 - 60.3",
                  "80.3 - 99.9",
                  "0.948 - 20.8"
              )
          ))
