# Elasticsearch documents functions.

Elasticsearch documents functions.

## Details

There are five functions to work directly with documents.

- [`docs_get()`](https://rfhb.github.io/elastic/reference/docs_get.md)

- [`docs_mget()`](https://rfhb.github.io/elastic/reference/docs_mget.md)

- [`docs_create()`](https://rfhb.github.io/elastic/reference/docs_create.md)

- [`docs_delete()`](https://rfhb.github.io/elastic/reference/docs_delete.md)

- [`docs_bulk()`](https://rfhb.github.io/elastic/reference/docs_bulk.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# Get a document
# docs_get(index='plos', type='article', id=1)

# Get multiple documents
# docs_mget(index="shakespeare", type="line", id=c(9,10))

# Create a document
# docs_create(index='plos', type='article', id=35, body=list(id="12345", title="New title"))

# Delete a document
# docs_delete(index='plos', type='article', id=35)

# Bulk load documents
# plosdat <- system.file("examples", "plos_data.json", package = "elastic")
# docs_bulk(plosdat)
} # }
```
