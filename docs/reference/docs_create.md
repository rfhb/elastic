# Create a document

Create a document

## Usage

``` r
docs_create(
  conn,
  index,
  body,
  type = NULL,
  id = NULL,
  version = NULL,
  version_type = NULL,
  op_type = NULL,
  routing = NULL,
  parent = NULL,
  timestamp = NULL,
  ttl = NULL,
  refresh = NULL,
  timeout = NULL,
  callopts = list(),
  ...
)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md)

- index:

  (character) The name of the index. Required

- body:

  The document

- type:

  (character) The type of the document. optional

- id:

  (numeric/character) The document ID. Can be numeric or character.
  Optional. if not provided, Elasticsearch creates the ID for you as a
  UUID.

- version:

  (character) Explicit version number for concurrency control

- version_type:

  (character) Specific version type. One of internal, external,
  external_gte, or force

- op_type:

  (character) Operation type. One of create, or ...

- routing:

  (character) Specific routing value

- parent:

  (numeric) A parent document ID

- timestamp:

  (date) Explicit timestamp for the document

- ttl:

  (aka “time to live”) Expiration time for the document. Expired
  documents will be expunged automatically. The expiration date that
  will be set for a document with a provided ttl is relative to the
  timestamp of the document, meaning it can be based on the time of
  indexing or on any time provided. The provided ttl must be strictly
  positive and can be a number (in milliseconds) or any valid time value
  (e.g, 86400000, 1d).

- refresh:

  (logical) Refresh the index after performing the operation

- timeout:

  (character) Explicit operation timeout, e.g,. 5m (for 5 minutes)

- callopts:

  Curl options passed on to
  [crul::HttpClient](https://docs.ropensci.org/crul/reference/HttpClient.html)

- ...:

  Further args to query DSL

## References

<https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-create>

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

# give a document id
z <- docs_create(x, index = 'plos', id = 1002,
  body = list(id = "12345", title = "New title"))
z
# and the document is there now
docs_get(x, index = 'plos', id = 1002)

# let Elasticsearch create the document id for you
z <- docs_create(x, index='plos', body=list(id="6789", title="Some title"))
z
# and the document is there now
docs_get(x, index='plos', id=z$`_id`)
} # }
```
