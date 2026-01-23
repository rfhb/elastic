# Search shards

Search shards

## Usage

``` r
search_shards(
  conn,
  index = NULL,
  raw = FALSE,
  routing = NULL,
  preference = NULL,
  local = NULL,
  ...
)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md)

- index:

  One or more indeces

- raw:

  If `TRUE` (default), data is parsed to list. If `FALSE`, then raw JSON

- routing:

  A character vector of routing values to take into account when
  determining which shards a request would be executed against.

- preference:

  Controls a preference of which shard replicas to execute the search
  request on. By default, the operation is randomized between the shard
  replicas. See
  [preference](https://rfhb.github.io/nodbi/reference/preference.md) for
  a list of all acceptable values.

- local:

  (logical) Whether to read the cluster state locally in order to
  determine where shards are allocated instead of using the Master
  node's cluster state.

- ...:

  Curl args passed on to
  [crul::verb-GET](https://docs.ropensci.org/crul/reference/verb-GET.html)

## References

<https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-search-shards>

## Examples

``` r
if (FALSE) { # \dontrun{
# connection setup
(x <- connect())

search_shards(x, index = "plos")
search_shards(x, index = c("plos","gbif"))
search_shards(x, index = "plos", preference='_primary')
search_shards(x, index = "plos", preference='_shards:2')

# curl options
search_shards(x, index = "plos", verbose = TRUE)
} # }
```
