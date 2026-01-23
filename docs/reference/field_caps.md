# Field capabilities

The field capabilities API allows to retrieve the capabilities of fields
among multiple indices.

## Usage

``` r
field_caps(conn, fields, index = NULL, ...)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md)

- fields:

  A list of fields to compute stats for. required

- index:

  Index name, one or more

- ...:

  Curl args passed on to
  [crul::verb-GET](https://docs.ropensci.org/crul/reference/verb-GET.html)

## References

<https://www.elastic.co/docs/api/doc/elasticsearch/operation/operation-field-caps>

## See also

[`field_stats()`](https://rfhb.github.io/nodbi/reference/field_stats.md)

## Examples

``` r
if (FALSE) { # \dontrun{
x <- connect()
x$ping()

if (x$es_ver() >= 540) {
  field_caps(x, fields = "speaker", index = "shakespeare")
}

} # }
```
