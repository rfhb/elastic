# Use the cat Elasticsearch api.

Use the cat Elasticsearch api.

## Usage

``` r
cat_(conn, parse = FALSE, ...)

cat_aliases(
  conn,
  verbose = FALSE,
  index = NULL,
  h = NULL,
  help = FALSE,
  bytes = FALSE,
  parse = FALSE,
  expand_wildcards = "all",
  ...
)

cat_allocation(
  conn,
  verbose = FALSE,
  h = NULL,
  help = FALSE,
  bytes = FALSE,
  parse = FALSE,
  ...
)

cat_count(
  conn,
  verbose = FALSE,
  index = NULL,
  h = NULL,
  help = FALSE,
  bytes = FALSE,
  parse = FALSE,
  ...
)

cat_segments(
  conn,
  verbose = FALSE,
  index = NULL,
  h = NULL,
  help = FALSE,
  bytes = FALSE,
  parse = FALSE,
  ...
)

cat_health(
  conn,
  verbose = FALSE,
  h = NULL,
  help = FALSE,
  bytes = FALSE,
  parse = FALSE,
  ...
)

cat_indices(
  conn,
  verbose = FALSE,
  index = NULL,
  h = NULL,
  help = FALSE,
  bytes = FALSE,
  parse = FALSE,
  ...
)

cat_master(
  conn,
  verbose = FALSE,
  index = NULL,
  h = NULL,
  help = FALSE,
  bytes = FALSE,
  parse = FALSE,
  ...
)

cat_nodes(
  conn,
  verbose = FALSE,
  h = NULL,
  help = FALSE,
  bytes = FALSE,
  parse = FALSE,
  ...
)

cat_nodeattrs(
  conn,
  verbose = FALSE,
  h = NULL,
  help = FALSE,
  bytes = FALSE,
  parse = FALSE,
  ...
)

cat_pending_tasks(
  conn,
  verbose = FALSE,
  h = NULL,
  help = FALSE,
  bytes = FALSE,
  parse = FALSE,
  ...
)

cat_plugins(
  conn,
  verbose = FALSE,
  h = NULL,
  help = FALSE,
  bytes = FALSE,
  parse = FALSE,
  ...
)

cat_recovery(
  conn,
  verbose = FALSE,
  index = NULL,
  h = NULL,
  help = FALSE,
  bytes = FALSE,
  parse = FALSE,
  ...
)

cat_thread_pool(
  conn,
  verbose = FALSE,
  index = NULL,
  h = NULL,
  help = FALSE,
  bytes = FALSE,
  parse = FALSE,
  ...
)

cat_shards(
  conn,
  verbose = FALSE,
  index = NULL,
  h = NULL,
  help = FALSE,
  bytes = FALSE,
  parse = FALSE,
  ...
)

cat_fielddata(
  conn,
  verbose = FALSE,
  index = NULL,
  fields = NULL,
  h = NULL,
  help = FALSE,
  bytes = FALSE,
  parse = FALSE,
  ...
)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/elastic/reference/connect.md)

- parse:

  (logical) Parse to a data.frame or not. Default: `FALSE`

- ...:

  Curl args passed on to
  [crul::HttpClient](https://docs.ropensci.org/crul/reference/HttpClient.html)

- verbose:

  (logical) If `TRUE` (default) the url call used printed to console

- index:

  (character) Index name

- h:

  (character) Fields to return

- help:

  (logical) Output available columns, and their meanings

- bytes:

  (logical) Give numbers back machine friendly. Default: `FALSE`

- expand_wildcards:

  (character) Whether to expand wildcard expression to concrete indices
  that are open, closed or both. Valid choices: 'open', 'closed',
  'hidden', 'none', 'all'. default: 'all'. Available in ES \>= v7.7

- fields:

  (character) Fields to return, only used with `fielddata`

## Details

See
<https://www.elastic.co/docs/api/doc/elasticsearch/group/endpoint-cat>
for the cat API documentation.

Note how `cat_()` has an underscore at the end to avoid conflict with
the function [`base::cat()`](https://rdrr.io/r/base/cat.html) in base R.

## Examples

``` r
if (FALSE) { # \dontrun{
# connection setup
(x <- connect())

# list Elasticsearch cat endpoints
cat_(x)

# Do other cat operations
cat_aliases(x)
alias_create(x, index = "plos", alias = c("tables", "chairs"))
cat_aliases(x, expand_wildcards='open')
cat_aliases(x, expand_wildcards='all')
cat_allocation(x)
cat_allocation(x, verbose=TRUE)
cat_count(x)
cat_count(x, index='plos')
cat_count(x, index='gbif')
cat_segments(x)
cat_segments(x, index='gbif')
cat_health(x)
cat_indices(x)
cat_master(x)
cat_nodes(x)
# cat_nodeattrs(x) # not available in older ES versions
cat_pending_tasks(x)
cat_plugins(x)
cat_recovery(x, verbose=TRUE)
cat_recovery(x, index='gbif')
cat_thread_pool(x)
cat_thread_pool(x, verbose=TRUE)
cat_shards(x)
cat_fielddata(x)
cat_fielddata(x, fields='body')

# capture cat data into a data.frame
cat_(x, parse = TRUE)
cat_indices(x, parse = TRUE)
cat_indices(x, parse = TRUE, verbose = TRUE)
cat_count(x, parse = TRUE)
cat_count(x, parse = TRUE, verbose = TRUE)
cat_health(x, parse = TRUE)
cat_health(x, parse = TRUE, verbose = TRUE)

# Get help - what does each column mean
head(cat_indices(x, help = TRUE, parse = TRUE))
cat_health(x, help = TRUE, parse = TRUE)
head(cat_nodes(x, help = TRUE, parse = TRUE))

# Get back only certain fields
cat_nodes(x)
cat_nodes(x, h = c('ip','port','heapPercent','name'))
cat_nodes(x, h = c('id', 'ip', 'port', 'v', 'm'))
cat_indices(x, verbose = TRUE)
cat_indices(x, verbose = TRUE, h = c('index','docs.count','store.size'))

# Get back machine friendly numbers instead of the normal human friendly
cat_indices(x, verbose = TRUE, bytes = TRUE)

# Curl options
# cat_count(x, timeout_ms = 1)
} # }
```
