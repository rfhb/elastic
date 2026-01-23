# Multi-search

Performs multiple searches, defined in a file

## Usage

``` r
msearch(conn, x, raw = FALSE, asdf = FALSE, ...)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md)

- x:

  (character) A file path

- raw:

  (logical) Get raw JSON back or not.

- asdf:

  (logical) If `TRUE`, use
  [`jsonlite::fromJSON()`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html)
  to parse JSON directly to a data.frame. If `FALSE` (Default), list
  output is given.

- ...:

  Curl args passed on to
  [crul::verb-POST](https://docs.ropensci.org/crul/reference/verb-POST.html)

## Details

This function behaves similarly to
[`docs_bulk()`](https://rfhb.github.io/nodbi/reference/docs_bulk.md) -
performs searches based on queries defined in a file.

## See also

[`Search_uri()`](https://rfhb.github.io/nodbi/reference/Search_uri.md)
[`Search()`](https://rfhb.github.io/nodbi/reference/Search.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- connect()

msearch1 <- system.file("examples", "msearch_eg1.json", package = "elastic")
readLines(msearch1)
msearch(x, msearch1)

tf <- tempfile(fileext = ".json")
cat('{"index" : "shakespeare"}', file = tf, sep = "\n")
cat('{"query" : {"match_all" : {}}, "from" : 0, "size" : 5}',  sep = "\n",
   file = tf, append = TRUE)
readLines(tf)
msearch(x, tf)
} # }
```
