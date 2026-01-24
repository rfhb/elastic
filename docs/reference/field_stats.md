# Search field statistics

Search field statistics

## Usage

``` r
field_stats(
  conn,
  fields = NULL,
  index = NULL,
  level = "cluster",
  body = list(),
  raw = FALSE,
  asdf = FALSE,
  ...
)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/elastic/reference/connect.md)

- fields:

  A list of fields to compute stats for. optional

- index:

  Index name, one or more

- level:

  Defines if field stats should be returned on a per index level or on a
  cluster wide level. Valid values are 'indices' and 'cluster' (default)

- body:

  Query, either a list or json

- raw:

  (logical) Get raw JSON back or not

- asdf:

  (logical) If `TRUE`, use
  [`fromJSON`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html)
  to parse JSON directly to a data.frame. If `FALSE` (Default), list
  output is given.

- ...:

  Curl args passed on to
  [crul::HttpClient](https://docs.ropensci.org/crul/reference/HttpClient.html)

## Details

The field stats api allows you to get statistical properties of a field
without executing a search, but looking up measurements that are
natively available in the Lucene index. This can be useful to explore a
dataset which you don't know much about. For example, this allows
creating a histogram aggregation with meaningful intervals based on the
min/max range of values.

The field stats api by defaults executes on all indices, but can execute
on specific indices too.

## Note

Deprecated in Elasticsearch versions equal to/greater than 5.4.0

## References

<https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-indices-field-usage-stats>

## See also

[`field_caps()`](https://rfhb.github.io/elastic/reference/field_caps.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- connect()

if (x$es_ver() < 500) {
  field_stats(x, body = '{ "fields": ["speaker"] }', index = "shakespeare")
  ff <- c("scientificName", "continent", "decimalLatitude", "play_name",
    "speech_number")
  field_stats(x, "play_name")
  field_stats(x, "play_name", level = "cluster")
  field_stats(x, ff, level = "indices")
  field_stats(x, ff)
  field_stats(x, ff, index = c("gbif", "shakespeare"))

  # can also pass a body, just as with Search()
  # field_stats(x, body = list(fields = "rating")) # doesn't work
  field_stats(x, body = '{ "fields": ["scientificName"] }', index = "gbif")

  body <- '{
    "fields" : ["scientificName", "decimalLatitude"]
  }'
  field_stats(x, body = body, level = "indices", index = "gbif")
}
} # }
```
