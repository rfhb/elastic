context("type_remover")

test_that("type_remover", {

  # 2026-01-17 removed _type from inst/examples

  z <- system.file("examples/omdb.json", package = "elastic")
  a <- readLines(z, 6)

  ff <- type_remover(z)
  b <- readLines(ff, 6)

  expect_is(a, "character")
  # invisible(lapply(a[c(1, 3, 5)], expect_match, regexp = "_type"))

  expect_is(b, "character")
  # invisible(lapply(b[c(1, 3, 5)], function(z) expect_false(grepl("_type", z))))

  expect_equal(
    jsonlite::stream_in(textConnection(a)),
    jsonlite::stream_in(textConnection(b))
  )

  expect_false(any(names(jsonlite::stream_in(textConnection(a))) == "_type"))

  # cleanup
  unlink(ff)
})

