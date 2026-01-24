# Get counts of the number of records per index.

Get counts of the number of records per index.

## Usage

``` r
count(conn, index = NULL, type = NULL, callopts = list(), verbose = TRUE, ...)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/elastic/reference/connect.md)

- index:

  Index, defaults to all indices

- type:

  Document type, optional

- callopts:

  Curl args passed on to
  [crul::verb-GET](https://docs.ropensci.org/crul/reference/verb-GET.html)

- verbose:

  If `TRUE` (default) the url call used printed to console.

- ...:

  Further args passed on to elastic search HTTP API as parameters.

## Details

See docs for the count API here
<https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-count>

You can also get a count of documents using
[`Search()`](https://rfhb.github.io/elastic/reference/Search.md) or
[`Search_uri()`](https://rfhb.github.io/elastic/reference/Search_uri.md)
and setting `size = 0`

## Examples

``` r
if (FALSE) { # \dontrun{
# connection setup
(x <- connect())

if (!index_exists(x, "plos")) {
  plosdat <- system.file("examples", "plos_data.json",
    package = "elastic")
  plosdat <- type_remover(plosdat)
  invisible(docs_bulk(x, plosdat))
}
if (!index_exists(x, "shakespeare")) {
  shake <- system.file("examples", "shakespeare_data_.json",
    package = "elastic")
  invisible(docs_bulk(x, shake))
}

count(x)
count(x, index='plos')
count(x, index='shakespeare')
count(x, index=c('plos','shakespeare'), q="a*")
count(x, index=c('plos','shakespeare'), q="z*")

# Curl options
count(x, callopts = list(verbose = TRUE))
} # }
```
