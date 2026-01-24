# Changelog

## elastic 1.2.2

- new maintainer
- fixed minor issues of some functions for recent OpenSearch and
  Elasticsearch versions
- fixed some tests and CI testing (Elasticsearch 8 and 9, OpenSearch 2
  and 3)

## elastic 1.2.1

- not released

## elastic 1.2.0

CRAN release: 2021-03-16

#### NEW FEATURES

- [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md) and
  [`Search_uri()`](https://rfhb.github.io/nodbi/reference/Search_uri.md)
  gain new parameter `ignore_unavailable` to determine what happens if
  an index name does not exist
  ([\#273](https://github.com/rfhb/elastic/issues/273))
- [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md) gains
  new parameter `ignore_version`. Internally, `elastic` sometimes checks
  the Elasticsearch version that the user is connected to to determine
  what to do. may be useful when it’s not possible to check the
  Elasticsearch version, e.g., when its not possible to ping the root
  route of the API ([\#275](https://github.com/rfhb/elastic/issues/275))
- all docs bulk functions gain parameter `digits` that is passed down to
  `jsonlite::toJSON() used internally`. thus, `digits` will control the
  number of decimal digits used in the JSON the package creates to be
  bulk loaded into Elasticsearch
  ([\#279](https://github.com/rfhb/elastic/issues/279))

#### MINOR IMPROVEMENTS

- fix README instructions on installing Elasticsearch from docker;
  there’s no latest tag, so use a specific version
  ([\#277](https://github.com/rfhb/elastic/issues/277)) thanks
  [@ColinFay](https://github.com/ColinFay)

## elastic 1.1.0

CRAN release: 2020-01-11

#### NEW FEATURES

- types were deprecated in Elasticsearch v7 and greater, and will be
  removed in Elasticsearch v8 and greater. this version makes type
  optional in all/most functions so that users with older Elasticsearch
  versions can still use them, but users with v7 or v8 installations
  don’t have to use them
  ([\#251](https://github.com/rfhb/elastic/issues/251))
  ([\#270](https://github.com/rfhb/elastic/issues/270))
- gains new method
  [`index_shrink()`](https://rfhb.github.io/nodbi/reference/indices.md)
  for index shrinking
  ([\#192](https://github.com/rfhb/elastic/issues/192))
- through fixing functionality in
  [`docs_bulk()`](https://rfhb.github.io/nodbi/reference/docs_bulk.md)
  to allow pipline attachments to work, all `docs_bulk` methods that do
  http requests (i.e, not prep fxns) gain the parameter `query` to pass
  through query parameters to the http request, including for example
  `pipeline`, `_source` etc.
  ([\#253](https://github.com/rfhb/elastic/issues/253))
- [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md) and
  [`Search_uri()`](https://rfhb.github.io/nodbi/reference/Search_uri.md)
  gain the parameter `track_total_hits` (default: `TRUE`)
  ([\#262](https://github.com/rfhb/elastic/issues/262)) thanks
  [@orenov](https://github.com/orenov)

#### MINOR IMPROVEMENTS

- the `warn` parameter in
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md) was
  not being used across the entire package; now all methods should
  capture any warnings returned in the Elasticsearch HTTP API headers
  ([\#261](https://github.com/rfhb/elastic/issues/261))
- clarify in docs that
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md) does
  not create a DBI like connection object
  ([\#265](https://github.com/rfhb/elastic/issues/265))
- fix warning in
  [`index_analyze()`](https://rfhb.github.io/nodbi/reference/indices.md)
  function where as is method [`I()`](https://rdrr.io/r/base/AsIs.html)
  should only be applied if the input parameter is not `NULL` - to avoid
  a warning ([\#269](https://github.com/rfhb/elastic/issues/269))

#### BUG FIXES

- fix to
  [`docs_bulk_update()`](https://rfhb.github.io/nodbi/reference/docs_bulk_update.md):
  subsetting data.frame’s was not working correctly when data.frame’s
  had only 1 column; fixed
  ([\#260](https://github.com/rfhb/elastic/issues/260))
- fix to internal method `es_ver()` in the `Elasticsearch` class to be
  more flexible in capturing Elasticsearch version
  ([\#268](https://github.com/rfhb/elastic/issues/268))
- require newest `crul` version, helps fix a problem with passing along
  authentication details
  ([\#267](https://github.com/rfhb/elastic/issues/267))

## elastic 1.0.0

CRAN release: 2019-04-11

#### BREAKING CHANGE

([\#87](https://github.com/rfhb/elastic/issues/87)) The
[`connect()`](https://rfhb.github.io/nodbi/reference/connect.md)
function is essentially the same, with some changes, but now you pass
the connection object to each function all. This indeed will break code.
That’s why this is a major version bump.

There is one very big downside to this: breaks existing code. That’s the
big one. I do apologize for this, but I believe that is outweighed by
the upsides: passing the connection object matches behavior in similar R
packages (e.g., all the SQL database clients); you can now manage as
many different connection objects as you like in the same R session;
having the connection object as an R6 class allows us to have some
simple methods on that object to ping the server, etc. In addition, all
functions will error with an informative message if you don’t pass the
connection object as the first thing.

#### NEW FEATURES

- gains new ingest functions `pipeline_create`, `pipeline_delete`,
  `pipeline_get`, `pipeline_simulate`, and
  [`pipeline_attachment()`](https://rfhb.github.io/nodbi/reference/ingest.md)
  ([\#191](https://github.com/rfhb/elastic/issues/191))
  ([\#226](https://github.com/rfhb/elastic/issues/226))
- gains new function
  [`docs_delete_by_query()`](https://rfhb.github.io/nodbi/reference/docs_delete_by_query.md)
  and
  [`docs_update_by_query()`](https://rfhb.github.io/nodbi/reference/docs_update_by_query.md)
  to delete or update multiple documents at once, respectively; and new
  function
  [`reindex()`](https://rfhb.github.io/nodbi/reference/reindex.md) to
  reindex all documents from one index to another
  ([\#237](https://github.com/rfhb/elastic/issues/237))
  ([\#195](https://github.com/rfhb/elastic/issues/195))
- now using `crul` for HTTP requests. this only should matter with
  respect to passing in curl options
  ([\#168](https://github.com/rfhb/elastic/issues/168))
- recent versions of Elasticsearch are starting to include warnings in
  response headers for deprecations and other things. These can now be
  turned on or off with
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md)
  ([\#241](https://github.com/rfhb/elastic/issues/241))
- gains new functions for the bulk API:
  [`docs_bulk_create()`](https://rfhb.github.io/nodbi/reference/docs_bulk_create.md),
  [`docs_bulk_delete()`](https://rfhb.github.io/nodbi/reference/docs_bulk_delete.md),
  [`docs_bulk_index()`](https://rfhb.github.io/nodbi/reference/docs_bulk_index.md).
  each of which are tailored to doing the operation in the function
  name: creating docs, deleting docs, or indexing docs
  ([\#183](https://github.com/rfhb/elastic/issues/183))
- gains new function
  [`type_remover()`](https://rfhb.github.io/nodbi/reference/type_remover.md)
  as a utility function to help users remove types from their files to
  use for bulk loading; could be used on example files in this package
  or user supplied files
  ([\#180](https://github.com/rfhb/elastic/issues/180))
- gains function
  [`alias_rename()`](https://rfhb.github.io/nodbi/reference/alias.md) to
  rename aliases

#### MINOR IMPROVEMENTS

- fixed [`scroll()`](https://rfhb.github.io/nodbi/reference/scroll.md)
  example that wasn’t working
  ([\#228](https://github.com/rfhb/elastic/issues/228))
- rework
  [`alias_create()`](https://rfhb.github.io/nodbi/reference/alias.md)
  ([\#230](https://github.com/rfhb/elastic/issues/230))
- move initialize Elasticsearch connection section of README higher up
  to emphasize it in the right place
  ([\#231](https://github.com/rfhb/elastic/issues/231)) thanks
  [@mbannert](https://github.com/mbannert)
- whether you want “simple” or “complete” errors no longer sets env vars
  internally, but is passed through the internal error checker so that
  choices about type of errors for different connection objects do not
  affect one another
  ([\#242](https://github.com/rfhb/elastic/issues/242))
- `docs_get` gains new parameters `source_includes` and
  `source_excludes` to include or exclude certain fields in the returned
  document ([\#246](https://github.com/rfhb/elastic/issues/246)) thanks
  [@Jensxy](https://github.com/Jensxy)
- added more examples to
  [`index_create()`](https://rfhb.github.io/nodbi/reference/indices.md)
  ([\#211](https://github.com/rfhb/elastic/issues/211))
- add examples to
  [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md) and
  [`Search_uri()`](https://rfhb.github.io/nodbi/reference/Search_uri.md)
  docs of how to use profiles
  (<https://www.elastic.co/guide/en/elasticsearch/reference/current/search-profile.html>)
  ([\#194](https://github.com/rfhb/elastic/issues/194))
- additional example added to
  [`docs_bulk_prep()`](https://rfhb.github.io/nodbi/reference/docs_bulk_prep.md)
  for doing a mix of actions (i.e., delete, create, etc.)
- improved examples throughout package docs so that examples are more
  self-contained
- add `include_type_name` param in mappings fxns
  ([\#250](https://github.com/rfhb/elastic/issues/250))

#### BUG FIXES

- [`docs_bulk_update()`](https://rfhb.github.io/nodbi/reference/docs_bulk_update.md)
  was not handling boolean values correctly. now fixed
  ([\#239](https://github.com/rfhb/elastic/issues/239))
  ([\#240](https://github.com/rfhb/elastic/issues/240)) thanks to
  [@dpmccabe](https://github.com/dpmccabe)

#### DEPRECATED AND DEFUNCT

- the [`info()`](https://rfhb.github.io/nodbi/reference/info-defunct.md)
  method has been moved inside of the connection object. after calling
  `x = connect()` you can call `x$info()`
- the [`ping()`](https://rfhb.github.io/nodbi/reference/ping.md) method
  has been marked as deprecated; instead, call
  [`ping()`](https://rfhb.github.io/nodbi/reference/ping.md) on the
  connection object created by a call to
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md)

## elastic 0.8.4

CRAN release: 2018-06-26

#### NEW FEATURES

- Gains new function
  [`docs_bulk_update()`](https://rfhb.github.io/nodbi/reference/docs_bulk_update.md)
  to do bulk updates to documents
  ([\#169](https://github.com/rfhb/elastic/issues/169))

#### MINOR IMPROVEMENTS

- Vignettes weren’t showing up on CRAN, fixed
  ([\#205](https://github.com/rfhb/elastic/issues/205))
- Added an example of using WKT in a query
  ([\#215](https://github.com/rfhb/elastic/issues/215))
- using markdown docs
  ([\#209](https://github.com/rfhb/elastic/issues/209))
- `id` is now optional in
  [`docs_create()`](https://rfhb.github.io/nodbi/reference/docs_create.md) -
  if you don’t pass a document identifier Elasticsearch generates one
  for you ([\#216](https://github.com/rfhb/elastic/issues/216)) thanks
  [@jbrant](https://github.com/jbrant)
- [`docs_bulk()`](https://rfhb.github.io/nodbi/reference/docs_bulk.md)
  gains new parameter `quiet` to optionally turn off the progress bar
  ([\#202](https://github.com/rfhb/elastic/issues/202))

#### BUG FIXES

- Fix to
  [`docs_bulk()`](https://rfhb.github.io/nodbi/reference/docs_bulk.md)
  for encoding in different locales
  ([\#223](https://github.com/rfhb/elastic/issues/223))
  ([\#224](https://github.com/rfhb/elastic/issues/224)) thanks
  [@Lchiffon](https://github.com/Lchiffon)
- Fix for
  [`index_get()`](https://rfhb.github.io/nodbi/reference/indices.md):
  you can now only pass in one value to the `features` parameter (one of
  settings, mappings, or aliases)
  ([\#218](https://github.com/rfhb/elastic/issues/218)) thanks
  [@happyshows](https://github.com/happyshows)
- Fix to
  [`index_create()`](https://rfhb.github.io/nodbi/reference/indices.md)
  to handle a list body, in addition to a JSON body
  ([\#214](https://github.com/rfhb/elastic/issues/214)) thanks
  [@emillykkejensen](https://github.com/emillykkejensen)
- Fix to
  [`docs_bulk()`](https://rfhb.github.io/nodbi/reference/docs_bulk.md)
  for document IDs as factors
  ([\#212](https://github.com/rfhb/elastic/issues/212)) thanks
  [@AMR-KELEG](https://github.com/AMR-KELEG)
- Temporary files created when using
  [`docs_bulk()`](https://rfhb.github.io/nodbi/reference/docs_bulk.md)
  (and taking up disk space) are cleaned up now (deleted), though if you
  pass in your own file paths you have to clean them up
  ([\#208](https://github.com/rfhb/elastic/issues/208)) thanks
  [@emillykkejensen](https://github.com/emillykkejensen)

## elastic 0.8.0

CRAN release: 2017-09-14

#### Scroll changes

- changed to S3 setup, with methods for `character` and `list`.
- first parameter of
  [`scroll()`](https://rfhb.github.io/nodbi/reference/scroll.md) and
  [`scroll_clear()`](https://rfhb.github.io/nodbi/reference/scroll.md)
  is now `x`, should only matter if you specified the parameter name for
  the first parameter
- `scroll` parameter in
  [`scroll()`](https://rfhb.github.io/nodbi/reference/scroll.md)
  function is now `time_scroll`
- Added `asdf` (for “as data.frame”) to
  [`scroll()`](https://rfhb.github.io/nodbi/reference/scroll.md) to give
  back a data.frame
  ([\#163](https://github.com/rfhb/elastic/issues/163))
- streaming option added to
  [`scroll()`](https://rfhb.github.io/nodbi/reference/scroll.md), see
  parameter `stream_opts` in the docs and examples
  ([\#160](https://github.com/rfhb/elastic/issues/160))
- general docs improvements
  ([\#182](https://github.com/rfhb/elastic/issues/182))

#### NEW FEATURES

- New functions `tasks` and `tasks_cancel` for the tasks API
  ([\#145](https://github.com/rfhb/elastic/issues/145))
- streaming option added to
  [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md), see
  parameter `stream_opts` in the docs and examples. `scroll` parameter
  in [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md) is
  now `time_scroll`
  ([\#160](https://github.com/rfhb/elastic/issues/160))
- New function `field_caps` (for field capabilities) - in ES v5.4 and
  greater
- New function `reindex` for the reindex ES API
  ([\#134](https://github.com/rfhb/elastic/issues/134))
- New functions `index_template_get`, `index_template_put`,
  `index_template_exists`, and `index_template_delete` for the indices
  templates ES API ([\#133](https://github.com/rfhb/elastic/issues/133))
- New function `index_forcemerge` for the ES index `_forcemerge` route
  ([\#176](https://github.com/rfhb/elastic/issues/176))

#### MINOR IMPROVEMENTS

- Added examples to docs for `Search` and `Search_uri` for how to show
  progress bar ([\#162](https://github.com/rfhb/elastic/issues/162))
- Small docs fix to `docs_bulk` to clarify what’s allowed as first
  parameter input ([\#173](https://github.com/rfhb/elastic/issues/173))
- `docs_bulk` change to internal JSON preparation to use `na = "null"`
  and `auto_unbox = TRUE` in the
  [`jsonlite::toJSON`](https://jeroen.r-universe.dev/jsonlite/reference/fromJSON.html)
  call. This means that `NA`’s in R become `null` in the JSON and atomic
  vectors are unboxed
  ([\#174](https://github.com/rfhb/elastic/issues/174)) thanks
  [@pieterprovoost](https://github.com/pieterprovoost)
- `mapping_create` gains `update_all_types` parameter; and new man file
  to explain how to enable fielddata if sorting needed
  ([\#164](https://github.com/rfhb/elastic/issues/164))
- `suggest` is used through query DSL instead of a route, added example
  to `Search` ([\#102](https://github.com/rfhb/elastic/issues/102))
- Now caching internal
  [`ping()`](https://rfhb.github.io/nodbi/reference/ping.md) calls - so
  that after the first one we used the cached version if called again
  within the same R session. Should help speed up some code with respect
  to http calls ([\#184](https://github.com/rfhb/elastic/issues/184))
  thanks [@henfiber](https://github.com/henfiber)
- Fixes to percolate functions and docs for differences in percolate
  functionality pre v5 and post v5
  ([\#176](https://github.com/rfhb/elastic/issues/176))
- All http requests now contain `content-type` headers, for the most
  part `application/json`
  ([\#197](https://github.com/rfhb/elastic/issues/197)), though
  functions that work with the bulk API use `application/x-ndjson`
  ([\#186](https://github.com/rfhb/elastic/issues/186))
- docs fix to `mapping_create` egs
  ([\#199](https://github.com/rfhb/elastic/issues/199))
- README now includes example of how to connect when your ES is using
  X-pack ([\#185](https://github.com/rfhb/elastic/issues/185)) thanks
  [@ugosan](https://github.com/ugosan)

#### BUG FIXES

- fixes for normalizing url paths
  ([\#181](https://github.com/rfhb/elastic/issues/181))
- fix to `type_exists` to work on ES versions less to and greater than
  v5 ([\#189](https://github.com/rfhb/elastic/issues/189))
- fix to `field_stats` to indicate that its no longer avail. in ES v5.4
  and above - and that the `fields` parameter in ES \>= v5 is gone
  ([\#190](https://github.com/rfhb/elastic/issues/190))

## elastic 0.7.8

CRAN release: 2016-11-09

#### NEW FEATURES

- New function
  [`docs_update()`](https://rfhb.github.io/nodbi/reference/docs_update.md)
  to do partial document updates
  ([\#152](https://github.com/rfhb/elastic/issues/152))
- New function
  [`docs_bulk_prep()`](https://rfhb.github.io/nodbi/reference/docs_bulk_prep.md)
  to prepare bulk format files that you can use to load into
  Elasticsearch with this package, on the command line, or in any other
  context (Python, Ruby, etc.)
  ([\#154](https://github.com/rfhb/elastic/issues/154))

#### MINOR IMPROVEMENTS

- We’re no longer running a check that your ES server is up before every
  request to the server. This makes request faster, but may lead to less
  informative errors when your server is down or in some other state
  than fully operational
  ([\#149](https://github.com/rfhb/elastic/issues/149))
- Tweaks here and there to make sure `elastic` works with Elasticsearch
  v5. Note that not all v5 features are included here yet.
  ([\#153](https://github.com/rfhb/elastic/issues/153))

#### BUG FIXES

- [`docs_bulk()`](https://rfhb.github.io/nodbi/reference/docs_bulk.md)
  was not working on single column data.frame’s. now is working.
  ([\#151](https://github.com/rfhb/elastic/issues/151)) thanks
  [@gustavobio](https://github.com/gustavobio)
- `docs_*` functions now support ids with whitespace in them.
  ([\#155](https://github.com/rfhb/elastic/issues/155))
- fixes to
  [`docs_mget()`](https://rfhb.github.io/nodbi/reference/docs_mget.md)
  to fix requesting certain fields back.

## elastic 0.7.6

CRAN release: 2016-08-25

#### BUG FIXES

- Allow usage of `es_base` parameter in
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md) -
  Now, instead of [`stop()`](https://rdrr.io/r/base/stop.html) on
  `es_base` usage, we use its value for `es_host`. Only pass in one or
  the other of `es_base` and `es_host`, not both.
  ([\#146](https://github.com/rfhb/elastic/issues/146)) thanks
  [@MarcinKosinski](https://github.com/MarcinKosinski)

## elastic 0.7.4

CRAN release: 2016-08-18

#### NEW FEATURES

- package gains new set of functions for working with search templates:
  [`Search_template()`](https://rfhb.github.io/nodbi/reference/Search_template.md),
  [`Search_template_register()`](https://rfhb.github.io/nodbi/reference/Search_template.md),
  [`Search_template_get()`](https://rfhb.github.io/nodbi/reference/Search_template.md),
  [`Search_template_delete()`](https://rfhb.github.io/nodbi/reference/Search_template.md),
  and
  [`Search_template_render()`](https://rfhb.github.io/nodbi/reference/Search_template.md)
  ([\#101](https://github.com/rfhb/elastic/issues/101))

#### MINOR IMPROVEMENTS

- Improved documentation for `docs_delete`, `docs_get` and `docs_create`
  to list correctly that numeric and character values are accepted for
  the id parameter - before stated that numeric values allowed only
  ([\#144](https://github.com/rfhb/elastic/issues/144)) thanks
  [@dominoFire](https://github.com/dominoFire)
- Added tests for illegal characters in index names.

#### BUG FIXES

- Fixed bug introduced into `Search` and related functions where
  wildcards in indeces didn’t work. Turned out we url escaped twice
  unintentionally. Fixed now, and more tests added for wildcards.
  ([\#143](https://github.com/rfhb/elastic/issues/143)) thanks
  [@martijnvanbeers](https://github.com/martijnvanbeers)

## elastic 0.7.2

CRAN release: 2016-08-03

#### MINOR IMPROVEMENTS

- Changed
  [`docs_bulk()`](https://rfhb.github.io/nodbi/reference/docs_bulk.md)
  to always return a list, whether it’s given a file, data.frame, or
  list. For a file, a named list is returned, while for a data.frame or
  list an unnamed list is returned as many chunks can be processed and
  we don’t attempt to wrangle the list output. Inputs of data.frame and
  list used to return `NULL` as we didn’t return anything from the
  internal for loop. You can wrap `docs_bulk` in
  [`invisible()`](https://rdrr.io/r/base/invisible.html) if you don’t
  want the list printed
  ([\#142](https://github.com/rfhb/elastic/issues/142))

#### BUG FIXES

- Fixed bug in
  [`docs_bulk()`](https://rfhb.github.io/nodbi/reference/docs_bulk.md)
  and [`msearch()`](https://rfhb.github.io/nodbi/reference/msearch.md)
  in which base URL construction was not done correctly
  ([\#141](https://github.com/rfhb/elastic/issues/141)) thanks
  [@steeled](https://github.com/steeled) !

## elastic 0.7.0

CRAN release: 2016-07-25

#### NEW FEATURES

- New function
  [`scroll_clear()`](https://rfhb.github.io/nodbi/reference/scroll.md)
  to clear search contexts created when using
  [`scroll()`](https://rfhb.github.io/nodbi/reference/scroll.md)
  ([\#140](https://github.com/rfhb/elastic/issues/140))
- New function
  [`ping()`](https://rfhb.github.io/nodbi/reference/ping.md) to ping an
  Elasticsearch server to see if it is up
  ([\#138](https://github.com/rfhb/elastic/issues/138))
- [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md) gains
  new parameter `es_path` to specify a context path, e.g., the `bar` in
  `http://foo.com/bar`
  ([\#137](https://github.com/rfhb/elastic/issues/137))

#### MINOR IMPROVEMENTS

- Change all
  [`httr::content()`](https://httr.r-lib.org/reference/content.html)
  calls to parse to plain text and UTF-8 encoding
  ([\#118](https://github.com/rfhb/elastic/issues/118))
- Added note to docs that when using
  [`scroll()`](https://rfhb.github.io/nodbi/reference/scroll.md) all
  scores are zero b/c scores are not calculated/tracked
  ([\#127](https://github.com/rfhb/elastic/issues/127))
- [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md) no
  longer pings the ES server when run, but can now be done separately
  with [`ping()`](https://rfhb.github.io/nodbi/reference/ping.md)
  ([\#139](https://github.com/rfhb/elastic/issues/139))
- Let http request headers be sent with all requests - set with
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md)
  ([\#129](https://github.com/rfhb/elastic/issues/129))
- Added `transport_schema` param to
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md) to
  specify http or https
  ([\#130](https://github.com/rfhb/elastic/issues/130))
- By default use UUIDs with bulk API with
  [`docs_bulk()`](https://rfhb.github.io/nodbi/reference/docs_bulk.md)
  ([\#125](https://github.com/rfhb/elastic/issues/125))

#### BUG FIXES

- Fix to fail well on empty body sent by user
  ([\#119](https://github.com/rfhb/elastic/issues/119))
- Fix to
  [`docs_bulk()`](https://rfhb.github.io/nodbi/reference/docs_bulk.md)
  function so that user supplied `doc_ids` are not changed at all now
  ([\#123](https://github.com/rfhb/elastic/issues/123))

## elastic 0.6.0

CRAN release: 2016-01-07

Compatibility for many Elasticsearch versions has improved. We’ve tested
on ES versions from the current (`v2.1.1`) back to `v1.0.0`, and
`elastic` works with all versions. There are some functions that stop
with a message with some ES versions simply because older versions may
not have had particular ES features. Please do let us know if you have
problems with older versions of ES, so we can improve compatibility.

#### NEW FEATURES

- Added
  [`index_settings_update()`](https://rfhb.github.io/nodbi/reference/indices.md)
  function to allow updating index settings
  ([\#66](https://github.com/rfhb/elastic/issues/66))
- All errors from the Elasticsearch server are now given back as `JSON`.
  Error parsing has thus changed in `elastic`. We now have two levels of
  error behavior: ‘simple’ and ‘complete’. These can be set in
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md) with
  the `errors` parameter. Simple errors give back often just that there
  was an error, sometimes a message with explanation is supplied.
  Complete errors give more explanation and even the ES stack trace if
  supplied in the ES error response
  ([\#92](https://github.com/rfhb/elastic/issues/92))
  ([\#93](https://github.com/rfhb/elastic/issues/93))
- New function
  [`msearch()`](https://rfhb.github.io/nodbi/reference/msearch.md) to do
  multi-searches. This works by defining queries in a file, much like is
  done for a file to be used in bulk loading.
  ([\#103](https://github.com/rfhb/elastic/issues/103))
- New function
  [`validate()`](https://rfhb.github.io/nodbi/reference/validate.md) to
  validate a search.
  ([\#105](https://github.com/rfhb/elastic/issues/105))
- New suite of functions to work with the percolator service:
  [`percolate_count()`](https://rfhb.github.io/nodbi/reference/percolate.md),
  [`percolate_delete()`](https://rfhb.github.io/nodbi/reference/percolate.md),
  [`percolate_list()`](https://rfhb.github.io/nodbi/reference/percolate.md),
  [`percolate_match()`](https://rfhb.github.io/nodbi/reference/percolate.md),
  [`percolate_register()`](https://rfhb.github.io/nodbi/reference/percolate.md).
  The percolator works by first storing queries into an index and then
  you define documents in order to retrieve these queries.
  ([\#106](https://github.com/rfhb/elastic/issues/106))
- New function
  [`field_stats()`](https://rfhb.github.io/nodbi/reference/field_stats.md)
  to find statistical properties of a field without executing a search
  ([\#107](https://github.com/rfhb/elastic/issues/107))
- Added a Code of Conduct
- New function
  [`cat_nodeattrs()`](https://rfhb.github.io/nodbi/reference/cat.md)
- New function
  [`index_recreate()`](https://rfhb.github.io/nodbi/reference/indices.md)
  as a convenience function that detects if an index exists, and if so,
  deletes it first, then creates it again.

#### MINOR IMPROVEMENTS

- [`docs_bulk()`](https://rfhb.github.io/nodbi/reference/docs_bulk.md)
  now supports passing in document ids (to the `_id` field) via the
  parameter `doc_ids` for each input data.frame or list & supports using
  ids already in data.frame’s or lists
  ([\#83](https://github.com/rfhb/elastic/issues/83))
- `cat_*()` functions cleaned up. previously, some functions had
  parameters that were essentially silently ignored. Those parameters
  dropped now from the functions.
  ([\#96](https://github.com/rfhb/elastic/issues/96))
- Elasticsearch had for a while ‘search exists’ functionality (via
  `/_search/exists`), but have removed that in favor of using regular
  `_search` with `size=0` and `terminate_after=1` instead.
  ([\#104](https://github.com/rfhb/elastic/issues/104))
- New parameter `lenient` in
  [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md) and
  `Search_uri` to allow format based failures to be ignored, or not
  ignored.
- Better error handling for
  [`docs_get()`](https://rfhb.github.io/nodbi/reference/docs_get.md)
  when gthe document isn’t found

#### BUG FIXES

- Fixed problems in
  [`docs_bulk()`](https://rfhb.github.io/nodbi/reference/docs_bulk.md)
  in the use case where users use the function in a for loop, for
  example, and indexing started over, replacing documents with the same
  id ([\#83](https://github.com/rfhb/elastic/issues/83))
- Fixed bug in [`cat_()`](https://rfhb.github.io/nodbi/reference/cat.md)
  functions in which they sometimes failed when `parse=TRUE`
  ([\#88](https://github.com/rfhb/elastic/issues/88))
- Fixed bug in
  [`docs_bulk()`](https://rfhb.github.io/nodbi/reference/docs_bulk.md)
  in which user supplied document IDs weren’t being passed correctly
  internally ([\#90](https://github.com/rfhb/elastic/issues/90))
- Fixed bug in
  [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md) and
  [`Search_uri()`](https://rfhb.github.io/nodbi/reference/Search_uri.md)
  where multiple indices weren’t supported, whereas they should have
  been - supported now
  ([\#115](https://github.com/rfhb/elastic/issues/115))

#### DEFUNCT

- The following functions are now defunct:
  [`mlt()`](https://rfhb.github.io/nodbi/reference/mlt-defunct.md),
  [`nodes_shutdown()`](https://rfhb.github.io/nodbi/reference/nodes-defunct.md),
  [`index_status()`](https://rfhb.github.io/nodbi/reference/index_status-defunct.md),
  and
  [`mapping_delete()`](https://rfhb.github.io/nodbi/reference/mapping_delete-defunct.md)
  ([\#94](https://github.com/rfhb/elastic/issues/94))
  ([\#98](https://github.com/rfhb/elastic/issues/98))
  ([\#99](https://github.com/rfhb/elastic/issues/99))
  ([\#110](https://github.com/rfhb/elastic/issues/110))

## elastic 0.5.0

CRAN release: 2015-07-03

#### NEW FEATURES

- Added
  [`index_settings_update()`](https://rfhb.github.io/nodbi/reference/indices.md)
  function to allow updating index settings
  ([\#66](https://github.com/rfhb/elastic/issues/66))

#### MINOR IMPROVEMENTS

- Replace `RCurl::curlEscape()` with
  [`curl::curl_escape()`](https://jeroen.r-universe.dev/curl/reference/curl_escape.html)
  ([\#81](https://github.com/rfhb/elastic/issues/81))
- Explicitly import non-base R functions
  ([\#80](https://github.com/rfhb/elastic/issues/80))

#### BUG FIXES

- Fixed problems introduced with `v1` of `httr`

## elastic 0.4.0

CRAN release: 2015-05-01

#### NEW FEATURES

- New function
  [`Search_uri()`](https://rfhb.github.io/nodbi/reference/Search_uri.md)
  where the search is defined entirely in the URL itself. Especially
  useful for cases in which `POST` requests are forbidden, e.g, on a
  server that prevents `POST` requests (which the function
  [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md) uses).
  ([\#58](https://github.com/rfhb/elastic/issues/58))
- New function
  [`nodes_shutdown()`](https://rfhb.github.io/nodbi/reference/nodes-defunct.md)
  ([\#23](https://github.com/rfhb/elastic/issues/23))
- [`docs_bulk()`](https://rfhb.github.io/nodbi/reference/docs_bulk.md)
  gains ability to push data into Elasticsearch via the bulk http API
  from data.frame or list objects. Previously, this function only would
  accept a file formatted correctly. In addition, gains new parameters:
  `index` - The index name to use. `type` - The type name to use.
  `chunk_size` - Size of each chunk.
  ([\#60](https://github.com/rfhb/elastic/issues/60))
  ([\#67](https://github.com/rfhb/elastic/issues/67))
  ([\#68](https://github.com/rfhb/elastic/issues/68))

#### MINOR IMPROVEMENTS

- `cat_*()` functions gain new parameters: `h` to specify what fields to
  return; `help` to output available columns, and their meanings;
  `bytes` to give numbers back machine friendly; `parse` Parse to a
  data.frame or not
- `cat_*()` functions can now optionally capture data returned in to a
  data.frame ([\#64](https://github.com/rfhb/elastic/issues/64))
- [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md) gains
  new parameter `search_path` to set the path that is used for
  searching. The default is `_search`, but sometimes in your
  configuration you’ve setup so that you don’t need that path, or it’s a
  different path. (023d28762e7e1028fcb0ad17867f08b5e2c92f93)

#### BUG FIXES

- In
  [`docs_mget()`](https://rfhb.github.io/nodbi/reference/docs_mget.md)
  added internal checker to make sure user passes in the right
  combination of `index`, `type`, and `id` parameters, or `index` and
  `type_id`, or just `index_type_id`
  ([\#42](https://github.com/rfhb/elastic/issues/42))
- Made `index`, `type`, and `id` parameters required in the function
  [`docs_get()`](https://rfhb.github.io/nodbi/reference/docs_get.md)
  ([\#43](https://github.com/rfhb/elastic/issues/43))
- Fixed bug in
  [`scroll()`](https://rfhb.github.io/nodbi/reference/scroll.md) to
  allow long `scroll_id`’s by passing scroll ids in the body instead of
  as query parameter ([\#44](https://github.com/rfhb/elastic/issues/44))
- In [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md)
  function, in the `error_parser()` error parser function, check to see
  if `error` element returned in response body from Elasticsearch, and
  if so, parse error, if not, pass on body (likely empty)
  ([\#45](https://github.com/rfhb/elastic/issues/45))
- In [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md)
  function, added helper function to check size and from parameter
  values passed in to make sure they are numbers.
  ([\#46](https://github.com/rfhb/elastic/issues/46))
- Across all functions where `index` and `type` parameters used, now
  using `RCurl::curlEscape()` to URL escape. Other parameters passed in
  are go through `httr` CRUD methods, and do URL escaping for us.
  ([\#49](https://github.com/rfhb/elastic/issues/49))
- Fixed links to development repo in DESCRIPTION file

## elastic 0.3.0

CRAN release: 2015-01-29

First version to go to CRAN.

#### NEW FEATURES

- Added a function
  [`scroll()`](https://rfhb.github.io/nodbi/reference/scroll.md) and a
  `scroll` parameter to the
  [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md)
  function ([\#36](https://github.com/rfhb/elastic/issues/36))
- Added the function
  [`explain()`](https://rfhb.github.io/nodbi/reference/explain.md) to
  easily get at explanation of search results.
- Added a help file added to help explain timem and distance units. See
  `?units-time` and `?units=distance`
- New help file added to list and explain the various search functions.
  See
  [`?searchapis`](https://rfhb.github.io/nodbi/reference/searchapis.md)
- New function
  [`tokenizer_set()`](https://rfhb.github.io/nodbi/reference/tokenizer_set.md)
  to set tokenizers
- [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md) run
  on package load to set default base url of `localhost` and port of
  `9200` - you can override this by running that fxn yourself, or
  storing `es_base`, `es_port`, etc. in your `.Rprofile` file.

#### IMPROVEMENTS

- Made CouchDB river plugin functions not exported for now, may bring
  back later.
- Added vignettes for an intro and for search details and examples
  ([\#2](https://github.com/rfhb/elastic/issues/2))
- `es_search()` changed to
  [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md).
- More datasets included in the package for bulk data load
  ([\#16](https://github.com/rfhb/elastic/issues/16))
- All examples wrapped in `\dontrun` instead of `\donttest` so they
  don’t fail on CRAN checks.
- `es_search_body()` removed - body based queries using the query DSL
  moved to the
  [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md)
  function, passed into the `body` parameter.

## elastic 0.2.0

#### IMPROVEMENTS

- Remoworked package API. Almost all functions have new names. Sorry for
  this major change but it needed to be done. This brings `elastic` more
  in line with the official Elasticsearch Python client
  (<http://elasticsearch-py.readthedocs.org/en/master/>).
- Similar functions are grouped together in the same manual file now to
  make finder related functions easier. For example, all functions that
  work with indices are on the `index` manual page, and all functions
  prefixed with `index_()`. Thematic manual files are: `index`, `cat`,
  `cluster`, `alias`, `cdbriver`, `connect`, `documents`, `mapping`,
  `nodes`, and `search`.
- Note that the function `es_cat()` was changed to
  [`cat_()`](https://rfhb.github.io/nodbi/reference/cat.md) - we avoided
  [`cat()`](https://rfhb.github.io/nodbi/reference/cat.md) because as
  you know there is already a widely used function in base R, see
  [`base::cat()`](https://rdrr.io/r/base/cat.html).
- We changed `cat` functions to separate functions for each command,
  instead of passing the command in as an argument. For example,
  `cat('aliases')` becomes
  [`cat_aliases()`](https://rfhb.github.io/nodbi/reference/cat.md).
- The `es_` prefix remains only for `es_search()`, as we have to avoid
  conflict with [`base::search()`](https://rdrr.io/r/base/search.html).
- Removed `assertthat` package import, using
  [`stopifnot()`](https://rdrr.io/r/base/stopifnot.html) instead
  ([\#14](https://github.com/rfhb/elastic/issues/14))

## elastic 0.1.0

#### NEW FEATURES

- First version.
