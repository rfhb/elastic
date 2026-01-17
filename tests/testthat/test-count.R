context("count")

x <- connect(port = Sys.getenv("TEST_ES_PORT"), warn = FALSE)
z <- connect(port = Sys.getenv("TEST_ES_PORT"), warn = TRUE)
load_shakespeare(x)

# sleep to make sure data is available as expected
Sys.sleep(2)

test_that("count", {
  a <- count(x)
  b <- count(x, index = 'shakespeare')
  c <- count(x, index = 'shakespeare', q = "a*")
  d <- count(x, index = 'shakespeare', q = "z*")

  expect_is(a, "integer")
  expect_is(b, "integer")
  expect_is(c, "integer")
  expect_is(d, "integer")

  expect_gt(b, 10)

  expect_error(count(x, "adfadf"), "no such index||IndexMissing")

})
