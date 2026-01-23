# Ping an Elasticsearch server.

Ping an Elasticsearch server.

## Usage

``` r
ping(conn, ...)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md)

- ...:

  Curl args passed on to
  [crul::verb-GET](https://docs.ropensci.org/crul/reference/verb-GET.html)

## See also

[`connect()`](https://rfhb.github.io/nodbi/reference/connect.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- connect()
ping(x)
# ideally call ping on the connetion object itself
x$ping()
} # }
```
