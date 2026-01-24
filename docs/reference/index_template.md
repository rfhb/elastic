# Index templates

Index templates allow you to define templates that will automatically be
applied when new indices are created

## Usage

``` r
index_template_put(
  conn,
  name,
  body = NULL,
  create = NULL,
  flat_settings = NULL,
  master_timeout = NULL,
  order = NULL,
  timeout = NULL,
  ...
)

index_template_get(conn, name = NULL, filter_path = NULL, ...)

index_template_exists(conn, name, ...)

index_template_delete(conn, name, ...)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/elastic/reference/connect.md)

- name:

  (character) The name of the template

- body:

  (character/list) The template definition

- create:

  (logical) Whether the index template should only be added if new or
  can also replace an existing one. Default: `FALSE`

- flat_settings:

  (logical) Return settings in flat format. Default: `FALSE`

- master_timeout:

  (integer) Specify timeout for connection to master

- order:

  (integer) The order for this template when merging multiple matching
  ones (higher numbers are merged later, overriding the lower numbers)

- timeout:

  (integer) Explicit operation timeout

- ...:

  Curl options. Or in `percolate_list` function, further args passed on
  to [`Search()`](https://rfhb.github.io/elastic/reference/Search.md)

- filter_path:

  (character) a regex for filtering output path, see example

## References

<https://www.elastic.co/docs/manage-data/data-store/templates>

## Examples

``` r
if (FALSE) { # \dontrun{
(x <- connect())

body <- '{
  "template": "te*",
  "settings": {
    "number_of_shards": 1
  },
  "mappings": {
    "type1": {
      "_source": {
        "enabled": false
      },
      "properties": {
        "host_name": {
          "type": "keyword"
        },
        "created_at": {
          "type": "date",
          "format": "EEE MMM dd HH:mm:ss Z YYYY"
        }
      }
    }
  }
}'
index_template_put(x, "template_1", body = body)

# get templates
index_template_get(x)
index_template_get(x, "template_1")
index_template_get(x, c("template_1", "template_2"))
index_template_get(x, "template_*")
## filter path
index_template_get(x, "template_1", filter_path = "*.template")

# template exists
index_template_exists(x, "template_1")
index_template_exists(x, "foobar")

# delete a template
index_template_delete(x, "template_1")
index_template_exists(x, "template_1")
} # }
```
