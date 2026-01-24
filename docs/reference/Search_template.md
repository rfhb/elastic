# Search or validate templates

Search or validate templates

## Usage

``` r
Search_template(conn, body = list(), raw = FALSE, ...)

Search_template_register(conn, template, body = list(), raw = FALSE, ...)

Search_template_get(conn, template, ...)

Search_template_delete(conn, template, ...)

Search_template_render(conn, body = list(), raw = FALSE, ...)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/elastic/reference/connect.md)

- body:

  Query, either a list or json.

- raw:

  (logical) If `FALSE` (default), data is parsed to list. If `TRUE`,
  then raw JSON returned

- ...:

  Curl args passed on to
  [crul::verb-POST](https://docs.ropensci.org/crul/reference/verb-POST.html)

- template:

  (character) a template name

## Template search

With `Search_template` you can search with a template, using mustache
templating. Added in Elasticsearch v1.1

## Template render

With `Search_template_render` you validate a template without conducting
the search. Added in Elasticsearch v2.0

## Pre-registered templates

Register a template with `Search_template_register`. You can get the
template with `Search_template_get` and delete the template with
`Search_template_delete`

You can also pre-register search templates by storing them in the
`config/scripts` directory, in a file using the .mustache extension. In
order to execute the stored template, reference it by it's name under
the template key, like `"file": "templateName", ...`

## References

<https://www.elastic.co/docs/solutions/search/search-templates>

## See also

[`Search()`](https://rfhb.github.io/elastic/reference/Search.md),
[`Search_uri()`](https://rfhb.github.io/elastic/reference/Search_uri.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# connection setup
(x <- connect())

if (!index_exists(x, "iris")) {
  invisible(docs_bulk(x, iris, "iris"))
}

body1 <- '{
  "inline" : {
    "query": { "match" : { "{{my_field}}" : "{{my_value}}" } },
    "size" : "{{my_size}}"
  },
  "params" : {
    "my_field" : "Species",
    "my_value" : "setosa",
    "my_size" : 3
  }
}'
Search_template(x, body = body1)

body2 <- '{
 "inline": {
   "query": {
      "match": {
          "Species": "{{query_string}}"
      }
   }
 },
 "params": {
   "query_string": "versicolor"
 }
}'
Search_template(x, body = body2)

# pass in a list
mylist <- list(
  inline = list(query = list(match = list(`{{my_field}}` = "{{my_value}}"))),
  params = list(my_field = "Species", my_value = "setosa", my_size = 3L)
)
Search_template(x, body = mylist)

## Validating templates w/ Search_template_render()
Search_template_render(x, body = body1)
Search_template_render(x, body = body2)

## pre-registered templates
### register a template
if (x$es_ver() <= 520) {
  body3 <- '{
    "template": {
       "query": {
           "match": {
               "Species": "{{query_string}}"
           }
       }
     }
  }'
  Search_template_register(x, 'foobar', body = body3)
} else {
  body3 <- '{
   "script": {
     "lang": "mustache",
       "source": {
         "query": {
           "match": {
             "Species": "{{query_string}}"
           }
         }
       }
     }
  }'
  Search_template_register(x, 'foobar', body = body3)
}

### get template
Search_template_get(x, 'foobar')

### use the template
body4 <- '{
 "id": "foobar",
    "params": {
      "query_string": "setosa"
  }
}'
Search_template(x, body = body4)

### delete the template
Search_template_delete(x, 'foobar')
} # }
```
