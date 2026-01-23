# Set connection details to an Elasticsearch engine.

Set connection details to an Elasticsearch engine.

## Usage

``` r
connect(
  host = "127.0.0.1",
  port = 9200,
  path = NULL,
  transport_schema = "http",
  user = NULL,
  pwd = NULL,
  headers = NULL,
  cainfo = NULL,
  force = FALSE,
  errors = "simple",
  warn = TRUE,
  ignore_version = FALSE,
  ...
)
```

## Arguments

- host:

  (character) The base host, defaults to `127.0.0.1`

- port:

  (character) port to connect to, defaults to `9200` (optional)

- path:

  (character) context path that is appended to the end of the url.
  Default: `NULL`, ignored

- transport_schema:

  (character) http or https. Default: `http`

- user:

  (character) User name, if required for the connection. You can
  specify, but ignored for now.

- pwd:

  (character) Password, if required for the connection. You can specify,
  but ignored for now.

- headers:

  named list of headers. These headers are used in all requests

- cainfo:

  (character) path to a crt bundle, passed to curl option `cainfo`

- force:

  (logical) Force re-load of connection details. Default: `FALSE`

- errors:

  (character) One of simple (Default) or complete. Simple gives http
  code and error message on an error, while complete gives both http
  code and error message, and stack trace, if available.

- warn:

  (logical) whether to throw warnings from the Elasticsearch server when
  provided. Pulls warnings from response headers when given. default:
  `TRUE`. To turn these off, you can set `warn=FALSE` or wrap function
  calls in [`suppressWarnings()`](https://rdrr.io/r/base/warning.html).
  You can also see warnings in headers by using curl verbose.

- ignore_version:

  (logical) ignore Elasticsearch version checks? default: `FALSE`.
  Setting this to `TRUE` may cause some problems, it has not been fully
  tested yet. You may want to set this to `TRUE` if it's not possible to
  ping the root route of the Elasticsearch instance, which has the
  Elasticsearch version. We use the version to do alter what request is
  sent as different Elasticsearch versions allow different parameters.

- ...:

  additional curl options to be passed in ALL http requests

## Details

The default configuration is set up for localhost access on port 9200,
with no username or password.

Running this connection method doesn't ping the ES server, but only
prints your connection details.

All connection details are stored within the returned object. We used to
store them in various env vars, but are now contained within the object
so you can have any number of connection objects and they shouldn't
conflict with one another.

## What is the connection object?

Creating a connection object with `connect()` does not create a DBI-like
connection object. DBI-like objects have externalptr, etc., while
`connect()` simply holds details about your Elasticsearch instance
(host, port, authentication, etc.) that is used by other methods in this
package to interact with your instances' ES API. `connect()` is more or
less a fancy list.

You can connect to different Elasticsearch intances within the same R
session by creating a separate connection object for each instance; then
pass the appropriate connection object to each `elastic` method.

## Examples

``` r
if (FALSE) { # \dontrun{
# the default is set to 127.0.0.1 (i.e., localhost) and port 9200
(x <- connect())
x$make_url()
x$ping()

# pass connection object to function calls
Search(x, q = "*:*")

# set username/password (hidden in print method)
connect(user = "me", pwd = "stuff")

# set a different host
# connect(host = '162.243.152.53')
# => http://162.243.152.53:9200

# set a different port
# connect(port = 8000)
# => http://localhost:8000

# set a different context path
# connect(path = 'foo_bar')
# => http://localhost:9200/foo_bar

# set to https
# connect(transport_schema = 'https')
# => https://localhost:9200

# set headers
connect(headers = list(a = 'foobar'))

# set cainfo path (hidden in print method)
connect(cainfo = '/some/path/bundle.crt')
} # }
```
