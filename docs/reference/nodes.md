# Elasticsearch nodes endpoints.

Elasticsearch nodes endpoints.

## Usage

``` r
nodes_stats(conn, node = NULL, metric = NULL, raw = FALSE, fields = NULL, ...)

nodes_info(conn, node = NULL, metric = NULL, raw = FALSE, ...)

nodes_hot_threads(
  conn,
  node = NULL,
  metric = NULL,
  threads = 3,
  interval = "500ms",
  type = NULL,
  raw = FALSE,
  ...
)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/elastic/reference/connect.md)

- node:

  The node

- metric:

  A metric to get. See Details.

- raw:

  If `TRUE` (default), data is parsed to list. If `FALSE`, then raw
  JSON.

- fields:

  You can get information about field data memory usage on node level or
  on index level

- ...:

  Curl args passed on to
  [crul::verb-GET](https://docs.ropensci.org/crul/reference/verb-GET.html)

- threads:

  (character) Number of hot threads to provide. Default: 3

- interval:

  (character) The interval to do the second sampling of threads.
  Default: 500ms

- type:

  (character) The type to sample, defaults to cpu, but supports wait and
  block to see hot threads that are in wait or block state.

## Details

<https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-nodes-stats>

By default, all stats are returned. You can limit this by combining any
of indices, os, process, jvm, network, transport, http, fs, breaker and
thread_pool. With the metric parameter you can select zero or more of:

- indices Indices stats about size, document count, indexing and
  deletion times, search times, field cache size, merges and flushes

- os retrieve information that concern the operating system

- fs File system information, data path, free disk space, read/write
  stats

- http HTTP connection information

- jvm JVM stats, memory pool information, garbage collection, buffer
  pools

- network TCP information

- os Operating system stats, load average, cpu, mem, swap

- process Process statistics, memory consumption, cpu usage, open file
  descriptors

- thread_pool Statistics about each thread pool, including current size,
  queue and rejected tasks

- transport Transport statistics about sent and received bytes in
  cluster communication

- breaker Statistics about the field data circuit breaker

`nodes_hot_threads()` returns plain text, so
[`base::cat()`](https://rdrr.io/r/base/cat.html) is used to print to the
console.

## Examples

``` r
if (FALSE) { # \dontrun{
# connection setup
(x <- connect())

(out <- nodes_stats(x))
nodes_stats(x, node = names(out$nodes))
nodes_stats(x, metric='get')
nodes_stats(x, metric='jvm')
nodes_stats(x, metric=c('os','process'))
nodes_info(x)
nodes_info(x, metric='process')
nodes_info(x, metric='jvm')
nodes_info(x, metric='http')
nodes_info(x, metric='network')
} # }
```
