# Elasticsearch alias APIs

Elasticsearch alias APIs

## Usage

``` r
alias_get(conn, index = NULL, alias = NULL, ignore_unavailable = FALSE, ...)

aliases_get(conn, index = NULL, alias = NULL, ignore_unavailable = FALSE, ...)

alias_exists(conn, index = NULL, alias = NULL, ...)

alias_create(
  conn,
  index,
  alias,
  filter = NULL,
  routing = NULL,
  search_routing = NULL,
  index_routing = NULL,
  ...
)

alias_rename(conn, index, alias, alias_new, ...)

alias_delete(conn, index = NULL, alias, ...)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/elastic/reference/connect.md)

- index:

  (character) An index name

- alias:

  (character) An alias name

- ignore_unavailable:

  (logical) What to do if an specified index name doesn't exist. If set
  to `TRUE` then those indices are ignored.

- ...:

  Curl args passed on to
  [crul::verb-POST](https://docs.ropensci.org/crul/reference/verb-POST.html),
  [crul::verb-GET](https://docs.ropensci.org/crul/reference/verb-GET.html),
  [crul::verb-HEAD](https://docs.ropensci.org/crul/reference/verb-HEAD.html),
  or
  [crul::verb-DELETE](https://docs.ropensci.org/crul/reference/verb-DELETE.html)

- filter:

  (named list) provides an easy way to create different "views" of the
  same index. Defined using Query DSL and is applied to all Search,
  Count, Delete By Query and More Like This operations with this alias.
  See examples

- routing, search_routing, index_routing:

  (character) Associate a routing value with an alias

- alias_new:

  (character) A new alias name, used in rename only

## Details

Note that you can also create aliases when you create indices by putting
the directive in the request body. See the Elasticsearch docs link

## References

<https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-indices-update-aliases>

## Author

Scott Chamberlain <myrmecocystus@gmail.com>

## Examples

``` r
if (FALSE) { # \dontrun{
# connection setup
(x <- connect())

if (!index_exists(x, "plos")) {
  plosdat <- system.file("examples", "plos_data.json", package = "elastic")
  invisible(docs_bulk(x, plosdat))
}
if (!index_exists(x, "shakespeare")) {
  shake <- system.file("examples", "shakespeare_data_.json", package = "elastic")
  invisible(docs_bulk(x, shake))
}

# Create/update an alias
alias_create(x, index = "plos", alias = "candles")
## more than one alias
alias_create(x, index = "plos", alias = c("tables", "chairs"))

# associate an alias with two multiple different indices
alias_create(x, index = c("plos", "shakespeare"), alias = "stools")

# Retrieve a specified alias
alias_get(x, index="plos")
alias_get(x, alias="tables")
alias_get(x, alias="stools")
aliases_get(x)

# rename an alias
aliases_get(x, "plos")
alias_rename(x, index = 'plos', alias = "stools", alias_new = "plates")
aliases_get(x, "plos")

# filtered aliases
alias_create(x, index = "plos", alias = "candles",
  filter = list(wildcard = list(title = "cell")))
## a search with the alias should give titles with cell in them
(titles <- Search(x, "candles", asdf = TRUE)$hits$hits$`_source.title`)
grepl("cell", titles, ignore.case = TRUE)

# routing
alias_create(x, index = "plos", alias = "candles",
  routing = "1")

# Check for alias existence
alias_exists(x, index = "plos")
alias_exists(x, alias = "tables")
alias_exists(x, alias = "adsfasdf")

# Delete an alias
alias_delete(x, index = "plos", alias = "tables")
alias_exists(x, alias = "tables")

# Curl options
alias_create(x, index = "plos", alias = "tables")
aliases_get(x, alias = "tables", verbose = TRUE)
} # }
```
