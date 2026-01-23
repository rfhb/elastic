# Defunct functions in elastic

- [`mlt()`](https://rfhb.github.io/nodbi/reference/mlt-defunct.md): The
  MLT API has been removed, use More Like This Query via
  [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md)

- [`nodes_shutdown()`](https://rfhb.github.io/nodbi/reference/nodes-defunct.md):
  The \_shutdown API has been removed. Instead, setup Elasticsearch to
  run as a service (see Running as a Service on Linux
  (<https://www.elastic.co/guide/en/elasticsearch/reference/2.0/setup-service.html>)
  or Running as a Service on Windows
  (<https://www.elastic.co/guide/en/elasticsearch/reference/2.0/setup-service-win.html>))
  or use the -p command line option to write the PID to a file.

- [`index_status()`](https://rfhb.github.io/nodbi/reference/index_status-defunct.md):
  \_status route for the index API has been removed. Replaced with the
  Indices Stats and Indices Recovery APIs.

- [`mapping_delete()`](https://rfhb.github.io/nodbi/reference/mapping_delete-defunct.md):
  Elasticsearch dropped this route in their API. Instead of deleting a
  mapping, delete the index and recreate with a new mapping.
