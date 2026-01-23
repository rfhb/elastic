# Overview of search functions

Overview of search functions

## Details

Elasticsearch search APIs include the following functions:

- [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md) -
  Search using the Query DSL via the body of the request.

- [`Search_uri()`](https://rfhb.github.io/nodbi/reference/Search_uri.md) -
  Search using the URI search API only. This may be needed for servers
  that block POST requests for security, or maybe you don't need
  complicated requests, in which case URI only requests are suffice.

- [`msearch()`](https://rfhb.github.io/nodbi/reference/msearch.md) -
  Multi Search - execute several search requests defined in a file
  passed to `msearch`

- [`search_shards()`](https://rfhb.github.io/nodbi/reference/search_shards.md) -
  Search shards.

- [`count()`](https://rfhb.github.io/nodbi/reference/count.md) - Get
  counts for various searches.

- [`explain()`](https://rfhb.github.io/nodbi/reference/explain.md) -
  Computes a score explanation for a query and a specific document. This
  can give useful feedback whether a document matches or didn't match a
  specific query.

- [`validate()`](https://rfhb.github.io/nodbi/reference/validate.md) -
  Validate a search

- [`field_stats()`](https://rfhb.github.io/nodbi/reference/field_stats.md) -
  Search field statistics

- [`percolate()`](https://rfhb.github.io/nodbi/reference/percolate.md) -
  Store queries into an index then, via the percolate API, define
  documents to retrieve these queries.

More will be added soon.

## References

<https://www.elastic.co/docs/api/doc/elasticsearch/group/endpoint-search>
