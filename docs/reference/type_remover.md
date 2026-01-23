# Utility function to remove 'type' from bulk load files

Types are being removed from Elasticsearch. This little function aims to
help remove "\_type" fields from bulk newline-delimited JSON files. See
Details.

## Usage

``` r
type_remover(file)
```

## Arguments

- file:

  (character) a file path, required

## Value

a file path for a temporary file with the types removed

## Details

Looks for any lines that have an "index" key, then drops any "\_type"
keys in the hash given by the "index" key.

You can of course manually modify these files as an alternative, in a
text editor or with command line tools like sed, etc.

## Examples

``` r
if (FALSE) { # \dontrun{
z <- system.file("examples/omdb.json", package = "elastic")
readLines(z, 6)
ff <- type_remover(z)
readLines(ff, 6)
unlink(ff)
} # }
```
