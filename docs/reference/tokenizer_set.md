# Tokenizer operations

Tokenizer operations

## Usage

``` r
tokenizer_set(conn, index, body, ...)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md)

- index:

  (character) A character vector of index names

- body:

  Query, either a list or json.

- ...:

  Curl options passed on to
  [crul::HttpClient](https://docs.ropensci.org/crul/reference/HttpClient.html)

## References

<https://www.elastic.co/docs/reference/text-analysis/tokenizer-reference>

## Author

Scott Chamberlain <myrmecocystus@gmail.com>

## Examples

``` r
if (FALSE) { # \dontrun{
# connection setup
(x <- connect())

# set tokenizer

## NGram tokenizer
body <- '{
        "settings" : {
             "analysis" : {
                 "analyzer" : {
                     "my_ngram_analyzer" : {
                         "tokenizer" : "my_ngram_tokenizer"
                     }
                 },
                 "tokenizer" : {
                     "my_ngram_tokenizer" : {
                         "type" : "nGram",
                         "min_gram" : "2",
                         "max_gram" : "3",
                         "token_chars": [ "letter", "digit" ]
                     }
                 }
             }
      }
}'
if (index_exists('test1')) index_delete('test1')
tokenizer_set(index = "test1", body=body)
index_analyze(text = "hello world", index = "test1",
  analyzer='my_ngram_analyzer')
} # }
```
