# Reindex

Reindex all documents from one index to another.

## Usage

``` r
reindex(
  conn,
  body,
  refresh = NULL,
  requests_per_second = NULL,
  slices = NULL,
  timeout = NULL,
  wait_for_active_shards = NULL,
  wait_for_completion = NULL,
  ...
)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md)

- body:

  (list/character/json) The search definition using the Query DSL and
  the prototype for the index request.

- refresh:

  (logical) Should the effected indexes be refreshed?

- requests_per_second:

  (integer) The throttle to set on this request in sub-requests per
  second. - 1 means no throttle. Default: 0

- slices:

  (integer) The number of slices this task should be divided into.
  Defaults to 1 meaning the task isn't sliced into subtasks. Default: 1

- timeout:

  (character) Time each individual bulk request should wait for shards
  that are unavailable. Default: '1m'

- wait_for_active_shards:

  (integer) Sets the number of shard copies that must be active before
  proceeding with the reindex operation. Defaults to 1, meaning the
  primary shard only. Set to all for all shard copies, otherwise set to
  any non-negative value less than or equal to the total number of
  copies for the shard (number of replicas + 1)

- wait_for_completion:

  (logical) Should the request block until the reindex is complete?
  Default: `TRUE`

- ...:

  Curl options, passed on to
  [crul::verb-POST](https://docs.ropensci.org/crul/reference/verb-POST.html)

## References

<https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-reindex>

## Examples

``` r
if (FALSE) { # \dontrun{
x <- connect()

if (!index_exists(x, "twitter")) index_create(x, "twitter")
if (!index_exists(x, "new_twitter")) index_create(x, "new_twitter")
body <- '{
  "source": {
    "index": "twitter"
  },
  "dest": {
    "index": "new_twitter"
  }
}'
reindex(x, body = body)
} # }
```
