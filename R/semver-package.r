#' \pkg{semver} parse semantic versions.
#'
#' \code{semver} has two functions:
#' \code{\link{parse_version}},
#' \code{\link{render_version}},
#'
#' \code{\link{parse_version}} takes as input a character vector with
#' elements following the specification at \url{http://semver.org/}.
#'
#' Comparisons can be done on the "svlist" and "svptr" classes returned
#' by \code{\link{parse_version}}. \code{\link{Ops}} and
#' \code{\link{summary}} methods are implemented for both classes.
#'
#' @importFrom Rcpp sourceCpp
#' @importFrom utils .DollarNames
#' @useDynLib semver
#' @name semver
#' @docType package
NULL
