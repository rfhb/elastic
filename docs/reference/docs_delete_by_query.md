# Delete documents by query

delete documents by query via a POST request

## Usage

``` r
docs_delete_by_query(
  conn,
  index,
  body,
  type = NULL,
  conflicts = NULL,
  routing = NULL,
  scroll_size = NULL,
  refresh = NULL,
  wait_for_completion = NULL,
  wait_for_active_shards = NULL,
  timeout = NULL,
  scroll = NULL,
  requests_per_second = NULL,
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

  (character/json) query to be passed on to POST request body

- type:

  (character) The type of the document. optional

- conflicts:

  (character) If you’d like to count version conflicts rather than cause
  them to abort then set `conflicts=proceed`

- routing:

  (character) Specific routing value

- scroll_size:

  (integer) By default uses scroll batches of 1000. Change batch size
  with this parameter.

- refresh:

  (logical) Refresh the index after performing the operation

- wait_for_completion:

  (logical) If `wait_for_completion=FALSE` then Elasticsearch will
  perform some preflight checks, launch the request, and then return a
  task which can be used with Tasks APIs to cancel or get the status of
  the task. Elasticsearch will also create a record of this task as a
  document at `.tasks/task/${taskId}`. This is yours to keep or remove
  as you see fit. When you are done with it, delete it so Elasticsearch
  can reclaim the space it uses. Default: `TRUE`

- wait_for_active_shards:

  (logical) controls how many copies of a shard must be active before
  proceeding with the request.

- timeout:

  (character) Explicit operation timeout, e.g,. 5m (for 5 minutes)

- scroll:

  (integer) control how long the "search context" is kept alive, eg
  `scroll='10m'`, by default it’s 5 minutes (`5m`)

- requests_per_second:

  (integer) any positive decimal number (1.4, 6, 1000, etc); throttles
  rate at which `_delete_by_query` issues batches of delete operations
  by padding each batch with a wait time. The throttling can be disabled
  by setting `requests_per_second=-1`

- ...:

  Curl args passed on to
  [crul::verb-POST](https://docs.ropensci.org/crul/reference/verb-POST.html)

## References

<https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-delete-by-query>

## See also

[`docs_update_by_query()`](https://rfhb.github.io/nodbi/reference/docs_update_by_query.md)

## Examples

``` r
if (FALSE) { # \dontrun{
(x <- connect())
x$ping()

plosdat <- system.file("examples", "plos_data.json",
  package = "elastic")
plosdat <- type_remover(plosdat)
if (!index_exists(x, "plos")) invisible(docs_bulk(x, plosdat))

# delete with fuzzy matching
body <- '{
  "query": {
    "match": {
      "title": {
        "query": "cells",
        "fuzziness": 1
      }
    }
  }
}'
docs_delete_by_query(x, index='plos', body = body)

# delete with no fuzziness
if (index_exists(x, "plos")) index_delete(x, 'plos')
invisible(docs_bulk(x, plosdat))
count(x, "plos")
body <- '{
  "query": {
    "match": {
      "title": {
        "query": "cells",
        "fuzziness": 0
      }
    }
  }
}'
docs_delete_by_query(x, index='plos', body = body)

# delete all docs with match_all query
if (index_exists(x, "plos")) index_delete(x, 'plos')
invisible(docs_bulk(x, plosdat))
body <- '{
  "query": {
    "match_all": {}
  }
}'
docs_delete_by_query(x, index='plos', body = body)

# put plos back in
if (index_exists(x, "plos")) index_delete(x, 'plos')
invisible(docs_bulk(x, plosdat))

# delete docs from more than one index
foo <- system.file("examples/foo.json", package = "elastic")
if (!index_exists(x, "foo")) invisible(docs_bulk(x, foo))
bar <- system.file("examples/bar.json", package = "elastic")
if (!index_exists(x, "bar")) invisible(docs_bulk(x, bar))

body <- '{
  "query": {
    "match_all": {}
  }
}'
docs_delete_by_query(x, index=c('foo','bar'),
  body = body, verbose = TRUE)
} # }
```
