# Explain a search query.

Explain a search query.

## Usage

``` r
explain(
  conn,
  index,
  id,
  type = NULL,
  source2 = NULL,
  fields = NULL,
  routing = NULL,
  parent = NULL,
  preference = NULL,
  source = NULL,
  q = NULL,
  df = NULL,
  analyzer = NULL,
  analyze_wildcard = NULL,
  lowercase_expanded_terms = NULL,
  lenient = NULL,
  default_operator = NULL,
  source_exclude = NULL,
  source_include = NULL,
  body = NULL,
  raw = FALSE,
  ...
)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/elastic/reference/connect.md)

- index:

  Only one index. Required

- id:

  Document id, only one. Required

- type:

  Only one document type, optional

- source2:

  (logical) Set to TRUE to retrieve the \_source of the document
  explained. You can also retrieve part of the document by using
  source_include & source_exclude (see Get API for more details). This
  matches the `_source` term, but we want to avoid the leading
  underscore.

- fields:

  Allows to control which stored fields to return as part of the
  document explained.

- routing:

  Controls the routing in the case the routing was used during indexing.

- parent:

  Same effect as setting the routing parameter.

- preference:

  Controls on which shard the explain is executed.

- source:

  Allows the data of the request to be put in the query string of the
  url.

- q:

  The query string (maps to the query_string query).

- df:

  The default field to use when no field prefix is defined within the
  query. Defaults to \_all field.

- analyzer:

  The analyzer name to be used when analyzing the query string. Defaults
  to the analyzer of the \_all field.

- analyze_wildcard:

  (logical) Should wildcard and prefix queries be analyzed or not.
  Default: `FALSE`

- lowercase_expanded_terms:

  Should terms be automatically lowercased or not. Default: `TRUE`

- lenient:

  If set to true will cause format based failures (like providing text
  to a numeric field) to be ignored. Default: `FALSE`

- default_operator:

  The default operator to be used, can be AND or OR. Defaults to OR.

- source_exclude:

  A vector of fields to exclude from the returned source2 field

- source_include:

  A vector of fields to extract and return from the source2 field

- body:

  The query definition using the Query DSL. This is passed in the body
  of the request.

- raw:

  If `TRUE` (default), data is parsed to list. If `FALSE`, then raw
  JSON.

- ...:

  Curl args passed on to
  [crul::HttpClient](https://docs.ropensci.org/crul/reference/HttpClient.html)

## References

<https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-explain>

## Examples

``` r
if (FALSE) { # \dontrun{
(x <- connect())

explain(x, index = "plos", id = 14, q = "title:Germ")

body <- '{
 "query": {
   "match": { "title": "Germ" }
 }
}'
explain(x, index = "plos", id = 14, body=body)
} # }
```
