## Test environments

* local: R Under development (unstable) (2026-01-21 r89314) on aarch64-apple-darwin20 with OpenSearch 3.4.0 (ok)

* Github actions: matrix of OpenSearch and Elasticsearch earlier and current versions; macOS, Windows and Ubuntu; R oldrel-1, release, devel (ok)

* Winbuilder: R version 4.4.3; R version 4.5.2 (2025-10-31 ucrt); R Under development (unstable) (2026-01-23 r89325 ucrt) (2025-02-28 ucrt) (ok)

* macOS builder: r-devel-macosx-arm64|4.6.0|macosx|macOS 26.2 (25C56)|Mac mini|Apple M1||en_US.UTF-8|macOS 14.4|clang-1700.6.3.2|GNU Fortran (GCC) 14.2.0 (ok)


## R CMD check results

0 errors | 0 warnings | 1 note ("Package was archived on CRAN")


## Reverse dependencies

* Checked 2 reverse dependencies (lgrExtra, nodbi) locally manually (ok)


## Submission reason

- New maintainer after packaged was archived on original maintainer's request

- Original maintainer Scott Chamberlain agreed (see https://github.com/ropensci/nodbi/issues/48#issuecomment-3764330745)

- Updates to code, tests and documentation to pass R CMD check, implement CI and enable CRAN submission


---- 

Thanks,
Ralf
