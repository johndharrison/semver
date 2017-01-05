#' Reset version field
#'
#' Reset the version field. "Major", "minor" and "patch" fields are set as
#'     integers, "prerelease" and "build" are set with character strings.
#'     Fields of lower precedence are reset to default value (0L or "")
#' @param x An object of class "svlist" or "svptr".
#' @param ... Additional arguments passed on to methods.
#'
#' @return returns an object of class svptr or svlist
#' @export
#'
#' @examples
#' semver <- parse_version(c("1.2.3", "1.2.4-alpha+bld1"))
#' reset_version(semver[[2]], "major", 1L)
#' semver[[1]] <- reset_version(semver[[1]], "major", 2L)
#' reset_version(semver, c("minor", "prerelease"), list(3L, "beta"))
#' reset_version(semver, c("prerelease"), list("hello", "world"))

reset_version <- function(x, field, value, ...){
  UseMethod("reset_version")
}

#' @export
#' @rdname reset_version
#' @param field For the "svptr" class a character string detailing the field to
#'     set (major, minor etc...). For the "svlist" class a character vector
#'     detailing the field to set for each list member.
#' @param value The value to set the field to. For fields "major", "minor"
#'     and "patch" this is an integer. For fields "prerelease" and "build"
#'     this is a character. For the "svptr" class value is a scalar. For
#'     the "svlist" class value is a list detailing the value to set for
#'     each list member.
reset_version.svptr <- function(x, field = c("major", "minor", "patch",
                                           "prerelease", "build"), value, ...){
  field <- match.arg(field)
  fieldIdx <- switch(field,
                     major = 1L,
                     minor = 2L,
                     patch = 3L,
                     prerelease = 4L,
                     build = 5L
  )
  if(fieldIdx < 4L){
    assertthat::assert_that(is_integer_sv(value))
  }else{
    assertthat::assert_that(is_string_sv(value))
  }
  reset_ptr(x, fieldIdx, value[1])
}

#' @export
#' @rdname reset_version
reset_version.svlist <- function(x, field, value, ...){
  assertthat::assert_that(is_list(value))
  res <- Map(reset_version, x = x, field = field, value = value)
  `class<-`(res, "svlist")
}
