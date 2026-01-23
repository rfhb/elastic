# Update a document

Update a document

## Usage

``` r
docs_update(
  conn,
  index,
  id,
  body,
  type = NULL,
  fields = NULL,
  source = NULL,
  version = NULL,
  version_type = NULL,
  routing = NULL,
  parent = NULL,
  timestamp = NULL,
  ttl = NULL,
  refresh = NULL,
  timeout = NULL,
  retry_on_conflict = NULL,
  wait_for_active_shards = NULL,
  detect_noop = NULL,
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

- id:

  (numeric/character) The document ID. Can be numeric or character.
  Required

- body:

  The document, either a list or json

- type:

  (character) The type of the document. optional

- fields:

  A comma-separated list of fields to return in the response

- source:

  Allows to control if and how the updated source should be returned in
  the response. By default the updated source is not returned.

- version:

  (character) Explicit version number for concurrency control

- version_type:

  (character) Specific version type. One of internal, external,
  external_gte, or force

- routing:

  (character) Specific routing value

- parent:

  ID of the parent document. Is is only used for routing and when for
  the upsert request

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

  Refresh the index after performing the operation.

- timeout:

  (character) Explicit operation timeout, e.g,. 5m (for 5 minutes)

- retry_on_conflict:

  Specify how many times should the operation be retried when a conflict
  occurs (default: 0)

- wait_for_active_shards:

  The number of shard copies required to be active before proceeding
  with the update operation.

- detect_noop:

  (logical) Specifying `TRUE` will cause Elasticsearch to check if there
  are changes and, if there aren't, turn the update request into a noop.

- callopts:

  Curl options passed on to
  [crul::HttpClient](https://docs.ropensci.org/crul/reference/HttpClient.html)

- ...:

  Further args to query DSL

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

docs_create(x, index='plos', id=1002,
  body=list(id="12345", title="New title"))
# and the document is there now
docs_get(x, index='plos', id=1002)
# update the document
docs_update(x, index='plos', id=1002,
  body = list(doc = list(title = "Even newer title again")))
# get it again, notice changes
docs_get(x, index='plos', id=1002)

if (!index_exists(x, 'stuffthings')) {
  index_create(x, "stuffthings")
}
docs_create(x, index='stuffthings', id=1,
  body=list(name = "foo", what = "bar"))
docs_update(x, index='stuffthings', id=1,
  body = list(doc = list(name = "hello", what = "bar")),
  source = 'name')
} # }
```
