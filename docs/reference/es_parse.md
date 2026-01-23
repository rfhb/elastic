# Parse raw data from es_get, es_mget, or es_search.

Parse raw data from es_get, es_mget, or es_search.

## Usage

``` r
es_parse(input, parsetype, verbose)

# S3 method for class 'es_GET'
es_parse(input, parsetype = "list", verbose = FALSE)

# S3 method for class 'index_delete'
es_parse(input, parsetype = "list", verbose = FALSE)

# S3 method for class 'bulk_make'
es_parse(input, parsetype = "list", verbose = FALSE)

# S3 method for class 'elastic_mget'
es_parse(input, parsetype = "list", verbose = FALSE)

# S3 method for class 'elastic_search'
es_parse(input, parsetype = "list", verbose = FALSE)

# S3 method for class 'elastic_status'
es_parse(input, parsetype = "list", verbose = FALSE)

# S3 method for class 'elastic_stats'
es_parse(input, parsetype = "list", verbose = FALSE)

# S3 method for class 'elastic_cluster_health'
es_parse(input, parsetype = "list", verbose = TRUE)

# S3 method for class 'elastic_cluster_health'
es_parse(input, parsetype = "list", verbose = TRUE)

# S3 method for class 'elastic_cluster_state'
es_parse(input, parsetype = "list", verbose = TRUE)

# S3 method for class 'elastic_cluster_settings'
es_parse(input, parsetype = "list", verbose = TRUE)

# S3 method for class 'elastic_cluster_stats'
es_parse(input, parsetype = "list", verbose = TRUE)

# S3 method for class 'elastic_cluster_pending_tasks'
es_parse(input, parsetype = "list", verbose = TRUE)

# S3 method for class 'elastic_nodes_stats'
es_parse(input, parsetype = "list", verbose = TRUE)

# S3 method for class 'elastic_nodes_info'
es_parse(input, parsetype = "list", verbose = TRUE)
```

## Arguments

- input:

  Output from solr_facet

- parsetype:

  One of 'list' or 'df' (data.frame). Only list possible for now.

- verbose:

  Print messages or not (default: FALSE).

## Details

This is the parser used internally in es_get, es_mget, and es_search,
but if you output raw data from es\_\* functions using raw=TRUE, then
you can use this function to parse that data (a es\_\* S3 object) after
the fact to a list of data.frame's for easier consumption.
