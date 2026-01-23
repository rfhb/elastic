# Multi Termvectors

Multi Termvectors

## Usage

``` r
mtermvectors(
  conn,
  index = NULL,
  type = NULL,
  ids = NULL,
  body = list(),
  pretty = TRUE,
  field_statistics = TRUE,
  fields = NULL,
  offsets = TRUE,
  parent = NULL,
  payloads = TRUE,
  positions = TRUE,
  preference = "random",
  realtime = TRUE,
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
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md)

- index:

  (character) The index in which the document resides.

- type:

  (character) The type of the document.

- ids:

  (character) One or more document ids

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

- preference:

  (character) Specify the node or shard the operation should be
  performed on (Default: `random`).

- realtime:

  (character) Specifies if request is real-time as opposed to
  near-real-time (Default: `TRUE`).

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

Multi termvectors API allows to get multiple termvectors based on an
index, type and id.

## References

<https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-mtermvectors>

## See also

[`termvectors()`](https://rfhb.github.io/nodbi/reference/termvectors.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- connect()

if (index_exists(x, 'omdb')) index_delete(x, "omdb")
omdb <- system.file("examples", "omdb.json", package = "elastic")
omdb <- type_remover(omdb)
invisible(docs_bulk(x, omdb))
out <- Search(x, "omdb", size = 2)$hits$hits
ids <- vapply(out, "[[", "", "_id")

# no index
body <- '{
   "docs": [
      {
         "_index": "omdb",
         "_id": "%s",
         "term_statistics": true
      },
      {
         "_index": "omdb",
         "_id": "%s",
         "fields": [
            "Plot"
         ]
      }
   ]
}'
mtermvectors(x, body = sprintf(body, ids[1], ids[2]))

# index given
body <- '{
   "docs": [
      {
         "_id": "%s",
         "fields": [
            "Plot"
         ],
         "term_statistics": true
      },
      {
         "_id": "%s",
         "fields": [
            "Title"
         ]
      }
   ]
}'
mtermvectors(x, 'omdb', body = sprintf(body, ids[1], ids[2]))

# parameters same for both documents, so can simplify
body <- '{
    "ids" : ["%s", "%s"],
    "parameters": {
        "fields": [
            "Plot"
        ],
        "term_statistics": true
    }
}'
mtermvectors(x, 'omdb', body = sprintf(body, ids[1], ids[2]))

# you can give user provided documents via the 'docs' parameter
## though you have to give index and type that exist in your Elasticsearch
## instance
body <- '{
   "docs": [
      {
         "_index": "omdb",
         "doc" : {
            "Director" : "John Doe",
            "Plot" : "twitter test test test"
         }
      },
      {
         "_index": "omdb",
         "doc" : {
           "Director" : "Jane Doe",
           "Plot" : "Another twitter test ..."
         }
      }
   ]
}'
mtermvectors(x, body = body)
} # }
```
