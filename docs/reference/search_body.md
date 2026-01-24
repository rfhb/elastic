# Full text search of Elasticsearch - body requests.

Full text search of Elasticsearch - body requests.

## Usage

``` r
search_body(
  conn,
  index = NULL,
  type = NULL,
  raw = FALSE,
  callopts = list(),
  query = list(),
  ...
)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/elastic/reference/connect.md)

- index:

  Index name

- type:

  Document type

- raw:

  If `TRUE` (default), data is parsed to list. If `FALSE`, then raw
  JSON.

- callopts:

  Curl args passed on to
  [crul::verb-POST](https://docs.ropensci.org/crul/reference/verb-POST.html)

- query:

  Query, either a list or json.

- ...:

  Further args passed on to elastic search HTTP API as parameters. Not
  used right now.

## Examples

``` r
if (FALSE) { # \dontrun{
# connection setup
# x <- connect()
# x$ping()

# pass in as an R list
aggs <- list(aggs = list(stats = list(terms = list(field = "text_entry"))))
# search_body(x, index="shakespeare", query=aggs)

# or pass in as json query with newlines, easy to read
aggs <- '{
    "aggs": {
        "stats" : {
            "terms" : {
                "field" : "text_entry"
            }
        }
    }
}'
# search_body(x, index="shakespeare", query=aggs)


# or pass in collapsed json string
aggs <- '{"aggs":{"stats":{"terms":{"field":"text_entry"}}}}'
# search_body(x, index="shakespeare", query=aggs)

# match query
match <- '{"query": {"match" : {"text_entry" : "Two Gentlemen"}}}'
# search_body(x, index="shakespeare", query=match)

# multi-match (multiple fields that is) query
mmatch <- '{"query": {"multi_match" : {"query" : "henry", "fields": 
["text_entry","play_name"]}}}'
# search_body(x, index="shakespeare", query=mmatch)

# bool query
mmatch <- '{
 "query": {
   "bool" : {
     "must_not" : {
       "range" : {
         "speech_number" : {
           "from" : 1, "to": 5
}}}}}}'
# search_body(x, index="shakespeare", query=mmatch)

# Boosting query
boost <- '{
 "query" : {
  "boosting" : {
      "positive" : {
          "term" : {
              "play_name" : "henry"
          }
      },
      "negative" : {
          "term" : {
              "text_entry" : "thou"
          }
      },
      "negative_boost" : 0.2
    }
 }
}'
# search_body(x, index="shakespeare", query=mmatch)
} # }
```
