#' Render semantic version
#'
#' Render a semantic version list or a semantic version pointer as an
#' R list giving the major, minor and patch version as an integer and the
#' prerelease and build version as a charcter
#'
#' @param x An object of class "svlist" or "svptr".
#' @param ... Additional arguments passed on to methods.
#'
#' @return A list of semantic versions represented as integers (major,
#'     minor, patch) and characters (prerelease, build)
#' @export
#'
#' @examples
#' semver <- parse_version(c("1.2.3", "1.2.4", "1.0.0", "1.2.4-beta+2", "2.1.3-alpha", "1.9.4"))
#' render_version(semver[[4]])
#' render_version(semver)

render_version <- function(x, ...){
  UseMethod("render_version")
}

#' @export
#' @rdname render_version
render_version.svptr <- function(x, ...){
  render_ptr(x)
}

#' @export
#' @rdname render_version
render_version.svlist <- function(x, ...){
  lapply(x, render_version)
}
