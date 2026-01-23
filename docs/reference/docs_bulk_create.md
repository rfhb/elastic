# Use the bulk API to create documents

Use the bulk API to create documents

## Usage

``` r
docs_bulk_create(
  conn,
  x,
  index = NULL,
  type = NULL,
  chunk_size = 1000,
  doc_ids = NULL,
  es_ids = TRUE,
  raw = FALSE,
  quiet = FALSE,
  query = list(),
  ...
)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md)

- x:

  A list, data.frame, or character path to a file. required.

- index:

  (character) The index name to use. Required for data.frame input, but
  optional for file inputs.

- type:

  (character) The type. default: `NULL`. Note that `type` is deprecated
  in Elasticsearch v7 and greater, and removed in Elasticsearch v8

- chunk_size:

  (integer) Size of each chunk. If your data.frame is smaller thank
  `chunk_size`, this parameter is essentially ignored. We write in
  chunks because at some point, depending on size of each document, and
  Elasticsearch setup, writing a very large number of documents in one
  go becomes slow, so chunking can help. This parameter is ignored if
  you pass a file name. Default: 1000

- doc_ids:

  An optional vector (character or numeric/integer) of document ids to
  use. This vector has to equal the size of the documents you are
  passing in, and will error if not. If you pass a factor we convert to
  character. Default: not passed

- es_ids:

  (boolean) Let Elasticsearch assign document IDs as UUIDs. These are
  sequential, so there is order to the IDs they assign. If `TRUE`,
  `doc_ids` is ignored. Default: `TRUE`

- raw:

  (logical) Get raw JSON back or not. If `TRUE` you get JSON; if `FALSE`
  you get a list. Default: `FALSE`

- quiet:

  (logical) Suppress progress bar. Default: `FALSE`

- query:

  (list) a named list of query parameters. optional. options include:
  pipeline, refresh, routing, \_source, \_source_excludes,
  \_source_includes, timeout, wait_for_active_shards. See the docs bulk
  ES page for details

- ...:

  Pass on curl options to
  [crul::HttpClient](https://docs.ropensci.org/crul/reference/HttpClient.html)

## Details

For doing create with a file already prepared for the bulk API, see
[`docs_bulk()`](https://rfhb.github.io/nodbi/reference/docs_bulk.md)

Only data.frame's are supported for now.

## References

<https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-bulk>

## See also

Other bulk-functions:
[`docs_bulk()`](https://rfhb.github.io/nodbi/reference/docs_bulk.md),
[`docs_bulk_delete()`](https://rfhb.github.io/nodbi/reference/docs_bulk_delete.md),
[`docs_bulk_index()`](https://rfhb.github.io/nodbi/reference/docs_bulk_index.md),
[`docs_bulk_prep()`](https://rfhb.github.io/nodbi/reference/docs_bulk_prep.md),
[`docs_bulk_update()`](https://rfhb.github.io/nodbi/reference/docs_bulk_update.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- connect()
if (index_exists(x, "foobar")) index_delete(x, "foobar")

df <- data.frame(name = letters[1:3], size = 1:3, id = 100:102)
docs_bulk_create(x, df, 'foobar', es_ids = FALSE)
Search(x, "foobar", asdf = TRUE)$hits$hits

# more examples
docs_bulk_create(x, mtcars, index = "hello")
## field names cannot contain dots
names(iris) <- gsub("\\.", "_", names(iris))
docs_bulk_create(x, iris, "iris")
## type can be missing, but index can not
docs_bulk_create(x, iris, "flowers")
## big data.frame, 53K rows, load ggplot2 package first
# res <- docs_bulk_create(x, diamonds, "diam")
# Search(x, "diam")$hits$total$value
} # }
```
