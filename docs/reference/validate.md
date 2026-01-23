# Validate a search

Validate a search

## Usage

``` r
validate(conn, index, type = NULL, ...)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md)

- index:

  Index name. Required.

- type:

  Document type. Optional.

- ...:

  Additional args passed on to
  [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md)

## See also

[`Search()`](https://rfhb.github.io/nodbi/reference/Search.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- connect()

if (!index_exists(x, "twitter")) index_create(x, "twitter")
docs_create(x, 'twitter', id=1, body = list(
   "user" = "foobar", 
   "post_date" = "2014-01-03",
   "message" = "trying out Elasticsearch"
 )
)
validate(x, "twitter", q='user:foobar')
validate(x, "twitter", q='user:foobar')

body <- '{
"query" : {
  "bool" : {
    "must" : {
      "query_string" : {
        "query" : "*:*"
      }
    },
    "filter" : {
      "term" : { "user" : "kimchy" }
    }
  }
}
}'
validate(x, "twitter", body = body)
} # }
```
