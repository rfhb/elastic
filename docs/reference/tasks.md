# Elasticsearch tasks endpoints

Elasticsearch tasks endpoints

## Usage

``` r
tasks(
  conn,
  task_id = NULL,
  nodes = NULL,
  actions = NULL,
  parent_task_id = NULL,
  detailed = FALSE,
  group_by = NULL,
  wait_for_completion = FALSE,
  timeout = NULL,
  raw = FALSE,
  ...
)

tasks_cancel(
  conn,
  node_id = NULL,
  task_id = NULL,
  nodes = NULL,
  actions = NULL,
  parent_task_id = NULL,
  detailed = FALSE,
  group_by = NULL,
  wait_for_completion = FALSE,
  timeout = NULL,
  raw = FALSE,
  ...
)
```

## Arguments

- conn:

  an Elasticsearch connection object, see
  [`connect()`](https://rfhb.github.io/nodbi/reference/connect.md)

- task_id:

  a task id

- nodes:

  (character) The nodes

- actions:

  (character) Actions

- parent_task_id:

  (character) A parent task ID

- detailed:

  (character) get detailed results. Default: `FALSE`

- group_by:

  (character) "nodes" (default, i.e., NULL) or "parents"

- wait_for_completion:

  (logical) wait for completion. Default: `FALSE`

- timeout:

  (integer) timeout time

- raw:

  If `TRUE` (default), data is parsed to list. If `FALSE`, then raw
  JSON.

- ...:

  Curl args passed on to
  [crul::verb-GET](https://docs.ropensci.org/crul/reference/verb-GET.html)
  or
  [crul::verb-POST](https://docs.ropensci.org/crul/reference/verb-POST.html)

- node_id:

  a node id

## References

<https://www.elastic.co/docs/api/doc/elasticsearch/group/endpoint-tasks>

## Examples

``` r
if (FALSE) { # \dontrun{
x <- connect()

tasks(x)
# tasks(x, parent_task_id = "1234")

# delete a task
# tasks_cancel(x)
} # }
```
