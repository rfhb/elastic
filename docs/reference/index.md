# Package index

## elastic

High level overview of package

- [`elastic`](https://rfhb.github.io/nodbi/reference/elastic.md)
  [`elastic-package`](https://rfhb.github.io/nodbi/reference/elastic.md)
  : elastic
- [`elastic-defunct`](https://rfhb.github.io/nodbi/reference/elastic-defunct.md)
  : Defunct functions in elastic

## Connect

- [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md) : Set
  connection details to an Elasticsearch engine.
- [`ping()`](https://rfhb.github.io/nodbi/reference/ping.md) : Ping an
  Elasticsearch server.

## Cat

- [`cat_()`](https://rfhb.github.io/nodbi/reference/cat.md)
  [`cat_aliases()`](https://rfhb.github.io/nodbi/reference/cat.md)
  [`cat_allocation()`](https://rfhb.github.io/nodbi/reference/cat.md)
  [`cat_count()`](https://rfhb.github.io/nodbi/reference/cat.md)
  [`cat_segments()`](https://rfhb.github.io/nodbi/reference/cat.md)
  [`cat_health()`](https://rfhb.github.io/nodbi/reference/cat.md)
  [`cat_indices()`](https://rfhb.github.io/nodbi/reference/cat.md)
  [`cat_master()`](https://rfhb.github.io/nodbi/reference/cat.md)
  [`cat_nodes()`](https://rfhb.github.io/nodbi/reference/cat.md)
  [`cat_nodeattrs()`](https://rfhb.github.io/nodbi/reference/cat.md)
  [`cat_pending_tasks()`](https://rfhb.github.io/nodbi/reference/cat.md)
  [`cat_plugins()`](https://rfhb.github.io/nodbi/reference/cat.md)
  [`cat_recovery()`](https://rfhb.github.io/nodbi/reference/cat.md)
  [`cat_thread_pool()`](https://rfhb.github.io/nodbi/reference/cat.md)
  [`cat_shards()`](https://rfhb.github.io/nodbi/reference/cat.md)
  [`cat_fielddata()`](https://rfhb.github.io/nodbi/reference/cat.md) :
  Use the cat Elasticsearch api.

## Search

Various search APIs

- [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md) : Full
  text search of Elasticsearch
- [`Search_template()`](https://rfhb.github.io/nodbi/reference/Search_template.md)
  [`Search_template_register()`](https://rfhb.github.io/nodbi/reference/Search_template.md)
  [`Search_template_get()`](https://rfhb.github.io/nodbi/reference/Search_template.md)
  [`Search_template_delete()`](https://rfhb.github.io/nodbi/reference/Search_template.md)
  [`Search_template_render()`](https://rfhb.github.io/nodbi/reference/Search_template.md)
  : Search or validate templates
- [`Search_uri()`](https://rfhb.github.io/nodbi/reference/Search_uri.md)
  : Full text search of Elasticsearch with URI search
- [`search_shards()`](https://rfhb.github.io/nodbi/reference/search_shards.md)
  : Search shards
- [`searchapis`](https://rfhb.github.io/nodbi/reference/searchapis.md) :
  Overview of search functions
- [`msearch()`](https://rfhb.github.io/nodbi/reference/msearch.md) :
  Multi-search
- [`count()`](https://rfhb.github.io/nodbi/reference/count.md) : Get
  counts of the number of records per index.
- [`explain()`](https://rfhb.github.io/nodbi/reference/explain.md) :
  Explain a search query.
- [`validate()`](https://rfhb.github.io/nodbi/reference/validate.md) :
  Validate a search
- [`field_stats()`](https://rfhb.github.io/nodbi/reference/field_stats.md)
  : Search field statistics
- [`field_caps()`](https://rfhb.github.io/nodbi/reference/field_caps.md)
  : Field capabilities
- [`fielddata`](https://rfhb.github.io/nodbi/reference/fielddata.md) :
  fielddata
- [`percolate_register()`](https://rfhb.github.io/nodbi/reference/percolate.md)
  [`percolate_match()`](https://rfhb.github.io/nodbi/reference/percolate.md)
  [`percolate_list()`](https://rfhb.github.io/nodbi/reference/percolate.md)
  [`percolate_count()`](https://rfhb.github.io/nodbi/reference/percolate.md)
  [`percolate_delete()`](https://rfhb.github.io/nodbi/reference/percolate.md)
  : Percolater
- [`scroll()`](https://rfhb.github.io/nodbi/reference/scroll.md)
  [`scroll_clear()`](https://rfhb.github.io/nodbi/reference/scroll.md) :
  Scroll search function
- [`preference`](https://rfhb.github.io/nodbi/reference/preference.md) :
  Preferences.

## Documents

Work with document APIs

- [`docs_bulk()`](https://rfhb.github.io/nodbi/reference/docs_bulk.md) :
  Use the bulk API to create, index, update, or delete documents.
- [`docs_bulk_create()`](https://rfhb.github.io/nodbi/reference/docs_bulk_create.md)
  : Use the bulk API to create documents
- [`docs_bulk_delete()`](https://rfhb.github.io/nodbi/reference/docs_bulk_delete.md)
  : Use the bulk API to delete documents
- [`docs_bulk_index()`](https://rfhb.github.io/nodbi/reference/docs_bulk_index.md)
  : Use the bulk API to index documents
- [`docs_bulk_prep()`](https://rfhb.github.io/nodbi/reference/docs_bulk_prep.md)
  : Use the bulk API to prepare bulk format data
- [`docs_bulk_update()`](https://rfhb.github.io/nodbi/reference/docs_bulk_update.md)
  : Use the bulk API to update documents
- [`docs_create()`](https://rfhb.github.io/nodbi/reference/docs_create.md)
  : Create a document
- [`docs_delete()`](https://rfhb.github.io/nodbi/reference/docs_delete.md)
  : Delete a document
- [`docs_delete_by_query()`](https://rfhb.github.io/nodbi/reference/docs_delete_by_query.md)
  : Delete documents by query
- [`docs_get()`](https://rfhb.github.io/nodbi/reference/docs_get.md) :
  Get documents
- [`docs_mget()`](https://rfhb.github.io/nodbi/reference/docs_mget.md) :
  Get multiple documents via the multiple get API
- [`docs_update()`](https://rfhb.github.io/nodbi/reference/docs_update.md)
  : Update a document
- [`docs_update_by_query()`](https://rfhb.github.io/nodbi/reference/docs_update_by_query.md)
  : Update documents by query
- [`documents`](https://rfhb.github.io/nodbi/reference/documents.md) :
  Elasticsearch documents functions.
- [`termvectors()`](https://rfhb.github.io/nodbi/reference/termvectors.md)
  : Termvectors
- [`mtermvectors()`](https://rfhb.github.io/nodbi/reference/mtermvectors.md)
  : Multi Termvectors

## Indices

Index APIs

- [`index_template_put()`](https://rfhb.github.io/nodbi/reference/index_template.md)
  [`index_template_get()`](https://rfhb.github.io/nodbi/reference/index_template.md)
  [`index_template_exists()`](https://rfhb.github.io/nodbi/reference/index_template.md)
  [`index_template_delete()`](https://rfhb.github.io/nodbi/reference/index_template.md)
  : Index templates
- [`index_get()`](https://rfhb.github.io/nodbi/reference/indices.md)
  [`index_exists()`](https://rfhb.github.io/nodbi/reference/indices.md)
  [`index_delete()`](https://rfhb.github.io/nodbi/reference/indices.md)
  [`index_create()`](https://rfhb.github.io/nodbi/reference/indices.md)
  [`index_recreate()`](https://rfhb.github.io/nodbi/reference/indices.md)
  [`index_close()`](https://rfhb.github.io/nodbi/reference/indices.md)
  [`index_open()`](https://rfhb.github.io/nodbi/reference/indices.md)
  [`index_stats()`](https://rfhb.github.io/nodbi/reference/indices.md)
  [`index_settings()`](https://rfhb.github.io/nodbi/reference/indices.md)
  [`index_settings_update()`](https://rfhb.github.io/nodbi/reference/indices.md)
  [`index_segments()`](https://rfhb.github.io/nodbi/reference/indices.md)
  [`index_recovery()`](https://rfhb.github.io/nodbi/reference/indices.md)
  [`index_optimize()`](https://rfhb.github.io/nodbi/reference/indices.md)
  [`index_forcemerge()`](https://rfhb.github.io/nodbi/reference/indices.md)
  [`index_upgrade()`](https://rfhb.github.io/nodbi/reference/indices.md)
  [`index_analyze()`](https://rfhb.github.io/nodbi/reference/indices.md)
  [`index_flush()`](https://rfhb.github.io/nodbi/reference/indices.md)
  [`index_clear_cache()`](https://rfhb.github.io/nodbi/reference/indices.md)
  [`index_shrink()`](https://rfhb.github.io/nodbi/reference/indices.md)
  : Index API operations
- [`alias_get()`](https://rfhb.github.io/nodbi/reference/alias.md)
  [`aliases_get()`](https://rfhb.github.io/nodbi/reference/alias.md)
  [`alias_exists()`](https://rfhb.github.io/nodbi/reference/alias.md)
  [`alias_create()`](https://rfhb.github.io/nodbi/reference/alias.md)
  [`alias_rename()`](https://rfhb.github.io/nodbi/reference/alias.md)
  [`alias_delete()`](https://rfhb.github.io/nodbi/reference/alias.md) :
  Elasticsearch alias APIs
- [`mapping_create()`](https://rfhb.github.io/nodbi/reference/mapping.md)
  [`mapping_get()`](https://rfhb.github.io/nodbi/reference/mapping.md)
  [`field_mapping_get()`](https://rfhb.github.io/nodbi/reference/mapping.md)
  [`type_exists()`](https://rfhb.github.io/nodbi/reference/mapping.md) :
  Mapping management
- [`reindex()`](https://rfhb.github.io/nodbi/reference/reindex.md) :
  Reindex

## Analysis

Analysis APIs

- [`tokenizer_set()`](https://rfhb.github.io/nodbi/reference/tokenizer_set.md)
  : Tokenizer operations

## Ingest

Ingest APIs

- [`pipeline_create()`](https://rfhb.github.io/nodbi/reference/ingest.md)
  [`pipeline_attachment()`](https://rfhb.github.io/nodbi/reference/ingest.md)
  [`pipeline_get()`](https://rfhb.github.io/nodbi/reference/ingest.md)
  [`pipeline_delete()`](https://rfhb.github.io/nodbi/reference/ingest.md)
  [`pipeline_simulate()`](https://rfhb.github.io/nodbi/reference/ingest.md)
  : Ingest API operations

## Cluster

Cluster/Nodes APIs

- [`nodes_stats()`](https://rfhb.github.io/nodbi/reference/nodes.md)
  [`nodes_info()`](https://rfhb.github.io/nodbi/reference/nodes.md)
  [`nodes_hot_threads()`](https://rfhb.github.io/nodbi/reference/nodes.md)
  : Elasticsearch nodes endpoints.
- [`cluster_settings()`](https://rfhb.github.io/nodbi/reference/cluster.md)
  [`cluster_health()`](https://rfhb.github.io/nodbi/reference/cluster.md)
  [`cluster_state()`](https://rfhb.github.io/nodbi/reference/cluster.md)
  [`cluster_stats()`](https://rfhb.github.io/nodbi/reference/cluster.md)
  [`cluster_reroute()`](https://rfhb.github.io/nodbi/reference/cluster.md)
  [`cluster_pending_tasks()`](https://rfhb.github.io/nodbi/reference/cluster.md)
  : Elasticsearch cluster endpoints
- [`tasks()`](https://rfhb.github.io/nodbi/reference/tasks.md)
  [`tasks_cancel()`](https://rfhb.github.io/nodbi/reference/tasks.md) :
  Elasticsearch tasks endpoints

## Utilities

Various utility functions

- [`units-distance`](https://rfhb.github.io/nodbi/reference/units-distance.md)
  : Distance units
- [`units-time`](https://rfhb.github.io/nodbi/reference/units-time.md) :
  Time units
- [`type_remover()`](https://rfhb.github.io/nodbi/reference/type_remover.md)
  : Utility function to remove 'type' from bulk load files
