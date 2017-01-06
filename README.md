semver
==========================
| CRAN version       | Travis build status   | Appveyor build status   | Coverage |
| :-------------: |:-------------:|:-------------:|:-------------:|
| [![CRAN version](http://www.r-pkg.org/badges/version/semver)](https://cran.r-project.org/package=semver) | [![Build Status](https://travis-ci.org/johndharrison/semver.svg?branch=master)](https://travis-ci.org/johndharrison/semver) | [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/johndharrison/semver?branch=master&svg=true)](https://ci.appveyor.com/project/johndharrison/semver) | [![codecov](https://codecov.io/gh/johndharrison/semver/branch/master/graph/badge.svg)](https://codecov.io/gh/johndharrison/semver)|

## Installation

You can install semver from github with:


``` r
# install.packages("devtools")
devtools::install_github("johndharrison/semver")
```


## Introduction

The `semver` package provides tools and functions for parsing, rendering 
and operating on semantic version strings. Semantic versioning is a simple 
set of rules and requirements that dictate how version numbers are 
assigned and incremented as outlined at [http://semver.org](http://semver.org).

A basic summary of how semantic versioning operates is given a version number MAJOR.MINOR.PATCH, increment the:

1. MAJOR version when you make incompatible API changes,
2. MINOR version when you add functionality in a backwards-compatible manner, and
3. PATCH version when you make backwards-compatible bug fixes.

Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.

## `semver` package

The `semver` package provides a wrapper for the C++14 semantic versioning parser
written by Marko Živanović. The project is currently hosted on 
[github](https://github.com/zmarko/semver). The [Rcpp package](https://github.com/RcppCore/Rcpp) was used to provide R bindings. Some 
changes were made on the C++ side as currently CRAN does not accept packages
compiling under C++14 (R version 3.4.0 should allow this in future).

## Examples

```
semver <- parse_version(c("1.2.3", "1.2.4", "1.0.0", "1.2.4-beta", "2.1.3-alpha", "1.9.4"))
max(semver)
ver124a <- semver[semver > "1.2.4-alpha"]
sort(ver124a)
# compare versions
semver[[1]] < semver[[2]]

# compare against a version
semver > semver[1]

# compare against a character string
semver > "1.7.2"

# sort versions
sort(semver)
order(semver)
rank(semver)

# get summary statistics
min(semver)
max(semver)
range(semver)

# coerce versions
as.character(semver)
as.data.frame(semver)
```

For more detail see the vignette [semver: Basics](https://CRAN.R-project.org/package=semver/vignettes/basics.html)
