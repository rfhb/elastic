# Termvectors

Termvectors

## Usage

``` r
termvectors(
  conn,
  index,
  type = NULL,
  id = NULL,
  body = list(),
  pretty = TRUE,
  field_statistics = TRUE,
  fields = NULL,
  offsets = TRUE,
  parent = NULL,
  payloads = TRUE,
  positions = TRUE,
  realtime = TRUE,
  preference = "random",
  routing = NULL,
  term_statistics = FALSE,
  version = NULL,
  version_type = NULL,
  ...
)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/elastic/reference/connect.md)

- index:

  (character) The index in which the document resides.

- type:

  (character) The type of the document. optional

- id:

  (character) The id of the document, when not specified a doc param
  should be supplied.

- body:

  (character) Define parameters and or supply a document to get
  termvectors for

- pretty:

  (logical) pretty print. Default: `TRUE`

- field_statistics:

  (character) Specifies if document count, sum of document frequencies
  and sum of total term frequencies should be returned. Default: `TRUE`

- fields:

  (character) A comma-separated list of fields to return.

- offsets:

  (character) Specifies if term offsets should be returned. Default:
  `TRUE`

- parent:

  (character) Parent id of documents.

- payloads:

  (character) Specifies if term payloads should be returned. Default:
  `TRUE`

- positions:

  (character) Specifies if term positions should be returned. Default:
  `TRUE`

- realtime:

  (character) Specifies if request is real-time as opposed to
  near-real-time (Default: `TRUE`).

- preference:

  (character) Specify the node or shard the operation should be
  performed on (Default: `random`).

- routing:

  (character) Specific routing value.

- term_statistics:

  (character) Specifies if total term frequency and document frequency
  should be returned. Default: `FALSE`

- version:

  (character) Explicit version number for concurrency control

- version_type:

  (character) Specific version type, valid choices are: 'internal',
  'external', 'external_gte', 'force'

- ...:

  Curl args passed on to
  [crul::verb-POST](https://docs.ropensci.org/crul/reference/verb-POST.html)

## Details

Returns information and statistics on terms in the fields of a
particular document. The document could be stored in the index or
artificially provided by the user (Added in 1.4). Note that for
documents stored in the index, this is a near realtime API as the term
vectors are not available until the next refresh.

## References

<https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-termvectors>

## See also

[`mtermvectors()`](https://rfhb.github.io/elastic/reference/mtermvectors.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- connect()

if (!index_exists(x, 'plos')) {
  plosdat <- system.file("examples", "plos_data.json",
    package = "elastic")
  plosdat <- type_remover(plosdat)
  invisible(docs_bulk(x, plosdat))
}
if (!index_exists(x, 'omdb')) {
  omdb <- system.file("examples", "omdb.json", package = "elastic")
  omdb <- type_remover(omdb)
  invisible(docs_bulk(x, omdb))
}

body <- '{
  "fields" : ["title"],
  "offsets" : true,
  "positions" : true,
  "term_statistics" : true,
  "field_statistics" : true
}'
termvectors(x, 'plos', id = 29, body = body)

body <- '{
  "fields" : ["Plot"],
  "offsets" : true,
  "positions" : true,
  "term_statistics" : true,
  "field_statistics" : true
}'
termvectors(x, 'omdb', id = Search(x, "omdb", size=1)$hits$hits[[1]]$`_id`,
body = body)
} # }
```
