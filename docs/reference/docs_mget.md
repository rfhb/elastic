# Get multiple documents via the multiple get API

Get multiple documents via the multiple get API

## Usage

``` r
docs_mget(
  conn,
  index = NULL,
  type = NULL,
  ids = NULL,
  type_id = NULL,
  index_type_id = NULL,
  source = NULL,
  fields = NULL,
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

  Index. Required.

- type:

  Document type. Required.

- ids:

  More than one document id, see examples.

- type_id:

  List of vectors of length 2, each with an element for type and id.

- index_type_id:

  List of vectors of length 3, each with an element for index, type, and
  id.

- source:

  (logical) If `TRUE`, return source.

- fields:

  Fields to return from the response object.

- raw:

  If TRUE (default), data is parsed to list. If FALSE, then raw JSON.

- callopts:

  Curl args passed on to
  [`HttpClient`](https://docs.ropensci.org/crul/reference/HttpClient.html)

- verbose:

  If TRUE (default) the url call used printed to console.

- ...:

  Further args passed on to elastic search HTTP API as parameters.

## Details

You can pass in one of three combinations of parameters:

- Pass in something for `index`, `type`, and `id`. This is the simplest,
  allowing retrieval from the same index, same type, and many ids.

- Pass in only `index` and `type_id` - this allows you to get multiple
  documents from the same index, but from different types.

- Pass in only `index_type_id` - this is so that you can get multiple
  documents from different indexes and different types.

## References

<https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-mget>

## Examples

``` r
if (FALSE) { # \dontrun{
(x <- connect())

if (!index_exists(x, 'plos')) {
  plosdat <- system.file("examples", "plos_data.json",
    package = "elastic")
  plosdat <- type_remover(plosdat)
  invisible(docs_bulk(x, plosdat))
}

# same index, many ids
docs_mget(x, index="plos", ids=c(9,10))

# Same index and type
docs_mget(x, index="plos", type="_doc", ids=c(9,10))

tmp <- docs_mget(x, index="plos", ids=c(9, 10), raw=TRUE)
es_parse(tmp)
docs_mget(x, index="plos", ids=c(9, 10), source='title')
docs_mget(x, index="plos", ids=c(14, 19), source=TRUE)

# curl options
docs_mget(x, index="plos", ids=1:2, callopts=list(verbose=TRUE))

# Same index, but different types
if (index_exists(x, 'shakespeare')) index_delete(x, 'shakespeare')
shakedat <- system.file("examples", "shakespeare_data.json",
  package = "elastic")
invisible(docs_bulk(x, shakedat))

docs_mget(x, index="shakespeare", type_id=list(c("scene",1), c("line",20)))
docs_mget(x, index="shakespeare", type_id=list(c("scene",1), c("line",20)),
  source='play_name')

# Different indices and different types pass in separately
docs_mget(x, index_type_id = list(
  c("shakespeare", "line", 20),
  c("plos", "article", 1)
 )
)
} # }
```
