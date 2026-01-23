# elastic

An Elasticsearch R client.

## About

This package gives you access to local or remote Elasticsearch
databases.

## Quick start

If you're connecting to a Elasticsearch server already running, skip
ahead to **Search**

Install Elasticsearch (on OSX)

- Download zip or tar file from Elasticsearch see here for download:
  <https://www.elastic.co/downloads/elasticsearch>

- Unzip it: `untar elasticsearch-2.3.5.tar.gz`

- Move it: `sudo mv elasticsearch-2.3.5 /usr/local` (replace version
  with your version)

- Navigate to /usr/local: `cd /usr/local`

- Add shortcut: `sudo ln -s elasticsearch-2.3.5 elasticsearch` (replace
  version with your version)

For help on other platforms, see
<https://www.elastic.co/docs/deploy-manage/deploy/self-managed/installing-elasticsearch>

**Start Elasticsearch**

- Navigate to elasticsearch: `cd /usr/local/elasticsearch`

- Start elasticsearch: `bin/elasticsearch`

**Initialization**

The function
[`connect()`](https://rfhb.github.io/nodbi/reference/connect.md) is used
before doing anything else to set the connection details to your remote
or local elasticsearch store. The details created by
[`connect()`](https://rfhb.github.io/nodbi/reference/connect.md) are
written to your options for the current session, and are used by
`elastic` functions.

**Search**

The main way to search Elasticsearch is via the
[`Search()`](https://rfhb.github.io/nodbi/reference/Search.md) function.
E.g.:

[`Search()`](https://rfhb.github.io/nodbi/reference/Search.md)

## Security

Elasticsearch is insecure out of the box! If you are running
Elasticsearch locally on your own machine without exposing a port to the
outside world, no worries, but if you install on a server with a public
IP address, take the necessary precautions. There are a few options:

- Shield - A paid product - so probably only applicable to enterprise
  users

- DIY security - there are a variety of techniques for securing your
  Elasticsearch. I collected a number of resources in a blog post at
  <https://recology.info/2015/02/secure-elasticsearch/>

## Elasticsearch changes

As of Elasticsearch v2:

- You can no longer create fields with dots in the name.

- Type names may not start with a dot (other than the special
  `.percolator` type)

- Type names may not be longer than 255 characters

- Types may no longer be deleted

- Queries and filters have been merged - all filter clauses are now
  query clauses. Instead, query clauses can now be used in query context
  or in filter context. See examples in
  [`Search()`](https://rfhb.github.io/nodbi/reference/Search.md) or
  [`Search_uri()`](https://rfhb.github.io/nodbi/reference/Search_uri.md)

## index names

The following are illegal characters, and can not be used in index names
or types: `\\`, `/`, `*`, `?`, `<`, `>`, `|`, `,` (comma). double quote
and whitespace are also illegal.

## See also

Useful links:

- <https://rfhb.github.io/nodbi>

- <https://www.elastic.co/docs/solutions/search>

- Report bugs at <https://github.com/rfhb/elastic/issues>

## Author

Scott Chamberlain
