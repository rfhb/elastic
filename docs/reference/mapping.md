# Mapping management

Mapping management

## Usage

``` r
mapping_create(
  conn,
  index,
  body,
  type = NULL,
  update_all_types = FALSE,
  include_type_name = NULL,
  ...
)

mapping_get(conn, index = NULL, type = NULL, include_type_name = NULL, ...)

field_mapping_get(
  conn,
  index = NULL,
  type = NULL,
  field,
  include_defaults = FALSE,
  include_type_name = NULL,
  ...
)

type_exists(conn, index, type, ...)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md)

- index:

  (character) An index

- body:

  (list) Either a list or json, representing the query.

- type:

  (character) A document type

- update_all_types:

  (logical) update all types. default: `FALSE`. This parameter is
  deprecated in ES v6.3.0 and higher, see
  https://github.com/elastic/elasticsearch/pull/28284

- include_type_name:

  (logical) If set to `TRUE`, you can include a type name, if not an
  error will occur. default: not set. See Details.

- ...:

  Curl options passed on to
  [crul::verb-PUT](https://docs.ropensci.org/crul/reference/verb-PUT.html),
  [crul::verb-GET](https://docs.ropensci.org/crul/reference/verb-GET.html),
  or
  [crul::verb-HEAD](https://docs.ropensci.org/crul/reference/verb-HEAD.html)

- field:

  (character) One or more field names

- include_defaults:

  (logical) Whether to return default values

## Details

Find documentation for each function at:

- `mapping_create` -
  <https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-indices-put-mapping>

- `type_exists` -
  <https://www.elastic.co/docs/manage-data/data-store/mapping/removal-of-mapping-types>

- `mapping_delete` - FUNCTION DEFUNCT - instead of deleting mapping,
  delete index and recreate index with new mapping

- `mapping_get` -
  <https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-indices-get-mapping>

- `field_mapping_get` -
  <https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-indices-get-mapping>

See
<https://www.elastic.co/docs/manage-data/data-store/mapping/removal-of-mapping-types>
for information on type removal

## Examples

``` r
if (FALSE) { # \dontrun{
# connection setup
(x <- connect())

# Used to check if a type/types exists in an index/indices
type_exists(x, index = "plos", type = "article")
type_exists(x, index = "plos", type = "articles")
type_exists(x, index = "shakespeare", type = "line")

# The put mapping API allows to register specific mapping definition for a specific type.
## a good mapping body
body <- list(properties = list(
 journal = list(type="text"),
 year = list(type="long")
))
if (!index_exists(x, "plos")) index_create(x, "plos")
mapping_create(x, index = "plos", type = "citation", body=body)
## OR if above fails, try
mapping_create(x, index = "plos", type = "citation", body=body,
  include_type_name=TRUE)
## ES >= 7, no type
mapping_create(x, index = "plos", body=body)

### or as json
body <- '{
  "properties": {
    "journal": { "type": "text" },
      "year": { "type": "long" }
}}'
mapping_create(x, index = "plos", type = "citation", body=body)
mapping_get(x, "plos", "citation")

## A bad mapping body
body <- list(things = list(properties = list(
  journal = list("text")
)))
# mapping_create(x, index = "plos", type = "things", body=body)

# Get mappings
mapping_get(x, '_all')
mapping_get(x, index = "plos")
mapping_get(x, index = c("shakespeare","plos"))
# mapping_get(x, index = "shakespeare", type = "act")
# mapping_get(x, index = "shakespeare", type = c("act","line"))

# Get field mappings
plosdat <- system.file("examples", "plos_data.json",
  package = "elastic")
plosdat <- type_remover(plosdat)
invisible(docs_bulk(x, plosdat))
field_mapping_get(x, index = "_all", field = "text")
field_mapping_get(x, index = "plos", field = "title")
field_mapping_get(x, index = "plos", field = "*")
field_mapping_get(x, index = "plos", field = "title", include_defaults = TRUE)
field_mapping_get(x, type = c("article","record"), field = c("title","class"))
field_mapping_get(x, type = "a*", field = "t*")

# Create geospatial mapping
if (index_exists(x, "gbifgeopoint")) index_delete(x, "gbifgeopoint")
file <- system.file("examples", "gbif_geopoint.json",
  package = "elastic")
file <- type_remover(file)
index_create(x, "gbifgeopoint")
body <- '{
 "properties" : {
   "location" : { "type" : "geo_point" }
 }
}'
mapping_create(x, "gbifgeopoint", body = body)
invisible(docs_bulk(x, file))

# update_all_fields, see also ?fielddata
if (x$es_ver() < 603) {
 mapping_create(x, "shakespeare", "record", update_all_types=TRUE, body = '{
   "properties": {
     "speaker": {
       "type":     "text",
       "fielddata": true
     }
   }
 }')
} else {
 index_create(x, 'brownchair')
 mapping_create(x, 'brownchair', body = '{
   "properties": {
     "foo": {
       "type":     "text",
       "fielddata": true
     }
   }
 }')
}

} # }
```
