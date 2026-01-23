# Use the bulk API to create, index, update, or delete documents.

Use the bulk API to create, index, update, or delete documents.

## Usage

``` r
docs_bulk(
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
  digits = NA,
  sf = NULL,
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

- digits:

  digits used by the parameter of the same name by
  [`jsonlite::toJSON()`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html)
  to convert data to JSON before being submitted to your ES instance.
  default: `NA`

- sf:

  used by
  [`jsonlite::toJSON()`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html)
  to convert sf objects. Set to "features" for conversion to GeoJSON.
  default: "dataframe"

- ...:

  Pass on curl options to
  [crul::HttpClient](https://docs.ropensci.org/crul/reference/HttpClient.html)

## Value

A list

## Details

More on the Bulk API:
<https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-bulk>

This function dispatches on data.frame or character input. Character
input has to be a file name or the function stops with an error message.

If you pass a data.frame to this function, we by default do an index
operation, that is, create the record in the index given by those
parameters to the function. Down the road perhaps we will try to support
other operations on the bulk API. if you pass a file, of course in that
file, you can specify any operations you want.

Row names are dropped from data.frame, and top level names for a list
are dropped as well.

A progress bar gives the progress for data.frames and lists - the
progress bar is based around a for loop, where progress indicates
progress along the iterations of the for loop, where each iteration is a
chunk of data that's converted to bulk format, then pushed into
Elasticsearch. The `character` method has no for loop, so no progress
bar.

## Document IDs

Document IDs can be passed in via the `doc_ids` paramater when passing
in data.frame or list, but not with files. If ids are not passed to
`doc_ids`, we assign document IDs from 1 to length of the object (rows
of a data.frame, or length of a list). In the future we may allow the
user to select whether they want to assign sequential numeric IDs or to
allow Elasticsearch to assign IDs, which are UUIDs that are actually
sequential, so you still can determine an order of your documents.

## Document IDs and Factors

If you pass in ids that are of class factor, we coerce them to character
with `as.character`. This applies to both data.frame and list inputs,
but not to file inputs.

## Large numbers for document IDs

Until recently, if you had very large integers for document IDs,
`docs_bulk` failed. It should be fixed now. Let us know if not.

## Missing data

As of elastic version `0.7.8.9515` we convert `NA` to `null` before
loading into Elasticsearch. Previously, fields that had an `NA` were
dropped - but when you read data back from Elasticsearch into R, you
retain those missing values as jsonlite fills those in for you. Now,
fields with `NA`'s are made into `null`, and are not dropped in
Elasticsearch.

Note also that null values can not be indexed or searched
<https://www.elastic.co/docs/reference/elasticsearch/mapping-reference/null-value>

## Tips

This function returns the response from Elasticsearch, but you'll likely
not be that interested in the response. If not, wrap your call to
`docs_bulk` in [`invisible()`](https://rdrr.io/r/base/invisible.html),
like so: `invisible(docs_bulk(...))`

## Connections/Files

We create temporary files, and connections to those files, when
data.frame's and lists are passed in to `docs_bulk()` (not when a file
is passed in since we don't need to create a file). After inserting data
into your Elasticsearch instance, we close the connections and delete
the temporary files.

There are some exceptions though. When you pass in your own file,
whether a tempfile or not, we don't delete those files after using
them - in case you need those files again. Your own tempfile's will be
cleaned up/delete when the R session ends. Non-tempfile's won't be
cleaned up/deleted after the R session ends.

## Elasticsearch versions that don't support type

See the
[`type_remover()`](https://rfhb.github.io/nodbi/reference/type_remover.md)
function.

## See also

Other bulk-functions:
[`docs_bulk_create()`](https://rfhb.github.io/nodbi/reference/docs_bulk_create.md),
[`docs_bulk_delete()`](https://rfhb.github.io/nodbi/reference/docs_bulk_delete.md),
[`docs_bulk_index()`](https://rfhb.github.io/nodbi/reference/docs_bulk_index.md),
[`docs_bulk_prep()`](https://rfhb.github.io/nodbi/reference/docs_bulk_prep.md),
[`docs_bulk_update()`](https://rfhb.github.io/nodbi/reference/docs_bulk_update.md)

## Examples

``` r
if (FALSE) { # \dontrun{
# connection setup
(x <- connect())

# From a file already in newline delimited JSON format
plosdat <- system.file("examples", "plos_data.json", package = "elastic")
docs_bulk(x, plosdat)
aliases_get(x)
index_delete(x, index='plos')
aliases_get(x)

# From a data.frame
docs_bulk(x, mtcars, index = "hello")
## field names cannot contain dots
names(iris) <- gsub("\\.", "_", names(iris))
docs_bulk(x, iris, "iris")
## type can be missing, but index can not
docs_bulk(x, iris, "flowers")
## big data.frame, 53K rows, load ggplot2 package first
# res <- docs_bulk(x, diamonds, "diam")
# Search(x, "diam")$hits$total

# From a list
docs_bulk(x, apply(iris, 1, as.list), index="iris")
docs_bulk(x, apply(USArrests, 1, as.list), index="arrests")
# dim_list <- apply(diamonds, 1, as.list)
# out <- docs_bulk(x, dim_list, index="diamfromlist")

# When using in a loop
## We internally get last _id counter to know where to start on next bulk
## insert but you need to sleep in between docs_bulk calls, longer the
## bigger the data is
files <- c(system.file("examples", "test1.csv", package = "elastic"),
           system.file("examples", "test2.csv", package = "elastic"),
           system.file("examples", "test3.csv", package = "elastic"))
for (i in seq_along(files)) {
  d <- read.csv(files[[i]])
  docs_bulk(x, d, index = "testes")
  Sys.sleep(1)
}
count(x, "testes")
index_delete(x, "testes")

# You can include your own document id numbers
## Either pass in as an argument
index_create(x, "testes")
files <- c(system.file("examples", "test1.csv", package = "elastic"),
           system.file("examples", "test2.csv", package = "elastic"),
           system.file("examples", "test3.csv", package = "elastic"))
tt <- vapply(files, function(z) NROW(read.csv(z)), numeric(1))
ids <- list(1:tt[1],
           (tt[1] + 1):(tt[1] + tt[2]),
           (tt[1] + tt[2] + 1):sum(tt))
for (i in seq_along(files)) {
  d <- read.csv(files[[i]])
  docs_bulk(x, d, index = "testes", doc_ids = ids[[i]],
    es_ids = FALSE)
}
count(x, "testes")
index_delete(x, "testes")

## or include in the input data
### from data.frame's
index_create(x, "testes")
files <- c(system.file("examples", "test1_id.csv", package = "elastic"),
           system.file("examples", "test2_id.csv", package = "elastic"),
           system.file("examples", "test3_id.csv", package = "elastic"))
readLines(files[[1]])
for (i in seq_along(files)) {
  d <- read.csv(files[[i]])
  docs_bulk(x, d, index = "testes")
}
count(x, "testes")
index_delete(x, "testes")

### from lists via file inputs
index_create(x, "testes")
for (i in seq_along(files)) {
  d <- read.csv(files[[i]])
  d <- apply(d, 1, as.list)
  docs_bulk(x, d, index = "testes")
}
count(x, "testes")
index_delete(x, "testes")

# data.frame's with a single column
## this didn't use to work, but now should work
db <- paste0(sample(letters, 10), collapse = "")
index_create(x, db)
res <- data.frame(foo = 1:10)
out <- docs_bulk(x, res, index = db)
count(x, db)
index_delete(x, db)


# data.frame with a mix of actions
## make sure you use a column named 'es_action' or this won't work
## if you need to delete or update you need document IDs
if (index_exists(x, "baz")) index_delete(x, "baz")
df <- data.frame(a = 1:5, b = 6:10, c = letters[1:5], stringsAsFactors = FALSE)
invisible(docs_bulk(x, df, "baz"))
Sys.sleep(3)
(res <- Search(x, 'baz', asdf=TRUE)$hits$hits)
df[1, "a"] <- 99
df[1, "c"] <- "aa"
df[3, "c"] <- 33
df[3, "c"] <- "cc"
df$es_action <- c('update', 'delete', 'update', 'delete', 'delete')
df$id <- res$`_id`
df
invisible(docs_bulk(x, df, "baz", es_ids = FALSE))
### or es_ids = FALSE and pass in document ids to doc_ids
# invisible(docs_bulk(df, "baz", es_ids = FALSE, doc_ids = df$id))
Search(x, 'baz', asdf=TRUE)$hits$hits


# Curl options
plosdat <- system.file("examples", "plos_data.json",
  package = "elastic")
plosdat <- type_remover(plosdat)
invisible(docs_bulk(x, plosdat, verbose = TRUE))


# suppress progress bar
invisible(docs_bulk(x, mtcars, index = "hello", quiet = TRUE))
## vs.
invisible(docs_bulk(x, mtcars, index = "hello", quiet = FALSE))
} # }
```
