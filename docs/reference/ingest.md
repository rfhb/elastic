# Ingest API operations

Ingest API operations

## Usage

``` r
pipeline_create(conn, id, body, ...)

pipeline_attachment(conn, index, id, pipeline, body, type = NULL, ...)

pipeline_get(conn, id, filter_path = NULL, ...)

pipeline_delete(conn, id, body, ...)

pipeline_simulate(conn, body, id = NULL, ...)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/elastic/reference/connect.md)

- id:

  (character) one or more pipeline id's. with delete, you can use a
  wildcard match

- body:

  body describing pipeline, see examples and Elasticsearch docs

- ...:

  Curl args passed on to
  [crul::verb-POST](https://docs.ropensci.org/crul/reference/verb-POST.html),
  [crul::verb-GET](https://docs.ropensci.org/crul/reference/verb-GET.html),
  [crul::verb-PUT](https://docs.ropensci.org/crul/reference/verb-PUT.html),
  or
  [crul::verb-DELETE](https://docs.ropensci.org/crul/reference/verb-DELETE.html)

- index:

  (character) an index. only used in `pipeline_attachment`

- pipeline:

  (character) a pipeline name. only used in `pipeline_attachment`

- type:

  (character) a type. only used in `pipeline_attachment`. by default
  this is set to `NULL` - optional in ES \<= v6.3; not allowed in ES \>=
  v6.4

- filter_path:

  (character) fields to return. deafults to all if not given

## Value

a named list

## Details

ingest/pipeline functions available in Elasticsearch v5 and greater

## Attachments

See <https://www.elastic.co/docs/reference/enrich-processor/attachment>
You need to install the attachment processor plugin to be able to use
attachments in pipelines

## References

<https://www.elastic.co/docs/api/doc/elasticsearch/group/endpoint-ingest>,
<https://www.elastic.co/docs/reference/enrich-processor/attachment>

## Examples

``` r
if (FALSE) { # \dontrun{
# connection setup
(x <- connect())

# create
body1 <- '{
  "description" : "do a thing",
  "version" : 123,
  "processors" : [
    {
      "set" : {
        "field": "foo",
        "value": "bar"
      }
    }
  ]
}'
body2 <- '{
  "description" : "do another thing",
  "processors" : [
    {
      "set" : {
        "field": "stuff",
        "value": "things"
      }
    }
  ]
}'
pipeline_create(x, id = 'foo', body = body1)
pipeline_create(x, id = 'bar', body = body2)

# get
pipeline_get(x, id = 'foo')
pipeline_get(x, id = 'bar')
pipeline_get(x, id = 'foo', filter_path = "*.version")
pipeline_get(x, id = c('foo', 'bar')) # get >1

# delete
pipeline_delete(x, id = 'foo')

# simulate
## with pipeline included
body <- '{
  "pipeline" : {
    "description" : "do another thing",
    "processors" : [
      {
        "set" : {
          "field": "stuff",
          "value": "things"
        }
      }
    ]
  },
  "docs" : [
    { "_source": {"foo": "bar"} },
    { "_source": {"foo": "world"} }
  ]
}'
pipeline_simulate(x, body)

## referencing existing pipeline
body <- '{
  "docs" : [
    { "_source": {"foo": "bar"} },
    { "_source": {"foo": "world"} }
  ]
}'
pipeline_simulate(x, body, id = "foo")

# attchments - Note: you need the attachment plugin for this, see above
body1 <- '{
  "description" : "do a thing",
  "version" : 123,
  "processors" : [
    {
      "attachment" : {
        "field" : "data"
      }
    }
  ]
}'
pipeline_create(x, "baz", body1)
body_attach <- '{
  "data": "e1xydGYxXGFuc2kNCkxvcmVtIGlwc3VtIGRvbG9yIHNpdCBhbWV0DQpccGFyIH0="
}'
if (!index_exists(x, "boomarang")) index_create(x, "boomarang")
docs_create(x, 'boomarang', id = 1, body = list(title = "New title"))
pipeline_attachment(x, "boomarang", "1", "baz", body_attach)
pipeline_get(x, id = 'baz')
} # }
```
