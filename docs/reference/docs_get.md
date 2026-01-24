# Get documents

Get documents

## Usage

``` r
docs_get(
  conn,
  index,
  id,
  type = NULL,
  source = NULL,
  fields = NULL,
  source_includes = NULL,
  source_excludes = NULL,
  exists = FALSE,
  raw = FALSE,
  callopts = list(),
  verbose = TRUE,
  ...
)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/elastic/reference/connect.md)

- index:

  (character) The name of the index. Required

- id:

  (numeric/character) The document ID. Can be numeric or character.
  Required

- type:

  (character) The type of the document. optional

- source:

  (logical) If `TRUE` (default), return source. note that it is actually
  set to `NULL` in the function definition, but within Elasticsearch, it
  returns the source by default. alternatively, you can pass a vector of
  field names to return.

- fields:

  Fields to return from the response object.

- source_includes, source_excludes:

  (character) fields to include in the returned document, or to exclude.
  a character vector

- exists:

  (logical) Only return a logical as to whether the document exists or
  not.

- raw:

  If `TRUE` (default), data is parsed to list. If `FALSE`, then raw
  JSON.

- callopts:

  Curl args passed on to
  [crul::HttpClient](https://docs.ropensci.org/crul/reference/HttpClient.html)

- verbose:

  If TRUE (default) the url call used printed to console.

- ...:

  Further args passed on to elastic search HTTP API as parameters.

## References

<https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-get>

## Examples

``` r
if (FALSE) { # \dontrun{
(x <- connect())

if (!index_exists(x, "shakespeare")) {
  shakespeare <- system.file("examples", "shakespeare_data_.json",
    package = "elastic")
  shakespeare <- type_remover(shakespeare)
  invisible(docs_bulk(x, shakespeare))
}

docs_get(x, index='shakespeare', id=10)
docs_get(x, index='shakespeare', id=12)
docs_get(x, index='shakespeare', id=12, source=TRUE)

# Get certain fields
if (x$es_ver() < 500) {
  ### ES < v5
  docs_get(x, index='shakespeare', id=10, fields='play_name')
  docs_get(x, index='shakespeare', id=10, fields=c('play_name','speaker'))
} else {
  ### ES > v5
  docs_get(x, index='shakespeare', id=10, source='play_name')
  docs_get(x, index='shakespeare', id=10, source=c('play_name','speaker'))
}

# Just test for existence of the document
docs_get(x, index='plos', id=1, exists=TRUE)
docs_get(x, index='plos', id=123456, exists=TRUE)

# source includes / excludes
docs_get(x, index='shakespeare', id=10, source_includes = "play_name")
docs_get(x, index='shakespeare', id=10, source_excludes = "play_name")
} # }
```
