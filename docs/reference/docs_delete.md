# Delete a document

Delete a document

## Usage

``` r
docs_delete(
  conn,
  index,
  id,
  type = NULL,
  refresh = NULL,
  routing = NULL,
  timeout = NULL,
  version = NULL,
  version_type = NULL,
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

- type:

  (character) The type of the document. optional

- refresh:

  (logical) Refresh the index after performing the operation

- routing:

  (character) Specific routing value

- timeout:

  (character) Explicit operation timeout, e.g,. 5m (for 5 minutes)

- version:

  (character) Explicit version number for concurrency control

- version_type:

  (character) Specific version type. One of internal or external

- callopts:

  Curl args passed on to
  [crul::HttpClient](https://docs.ropensci.org/crul/reference/HttpClient.html)

- ...:

  Further args to query DSL

## References

<https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-delete-by-query>

## Examples

``` r
if (FALSE) { # \dontrun{
(x <- connect())
x$ping()

if (!index_exists(x, "plos")) {
 plosdat <- system.file("examples", "plos_data.json",
    package = "elastic")
 plosdat <- type_remover(plosdat)
 docs_bulk(x, plosdat)
}

# delete a document
if (!docs_get(x, index='plos', id=36, exists=TRUE)) {
  docs_create(x, index='plos', id=36,
    body = list(id="12345", title="New title")
  )
}
docs_get(x, index='plos', id=36)
docs_delete(x, index='plos', id=36)
# docs_get(x, index='plos', id=36) # and the document is gone
} # }
```
