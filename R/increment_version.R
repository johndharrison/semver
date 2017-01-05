#' Increment version field
#'
#' Increment the version field. "Major", "minor" and "patch" fields are set as
#'     integers.
#'     Fields of lower precedence are reset to default value (0L)
#' @param x An object of class "svlist" or "svptr".
#' @param ... Additional arguments passed on to methods.
#'
#' @return returns an object of class svptr or svlist
#' @export
#'
#' @examples
#' semver <- parse_version(c("1.2.3", "1.2.4-alpha+bld1"))
#' increment_version(semver[[2]], "major", 1L)
#' increment_version(semver[[2]], "major", -1L)
#' increment_version(semver, c("minor", "patch"), c(3L, 9L))
#' increment_version(semver, c("minor", "patch"), c(-1L, -3L))
#' increment_version(semver, c("minor"), 1L)

increment_version <- function(x, field, value, ...){
  UseMethod("increment_version")
}

#' @export
#' @rdname increment_version
#' @param field For the "svptr" class a character string detailing the field to
#'     set (major, minor etc...). For the "svlist" class a character vector
#'     detailing the field to set for each list member.
#' @param value The value to increment the field by. For fields "major", "minor"
#'     and "patch" this is an integer. For the "svptr" class value is a scalar. For
#'     the "svlist" class value is an integer vector detailing the value to increment by for
#'     each list member.
increment_version.svptr <-
  function(x, field = c("major", "minor", "patch"), value, ...){
    field <- match.arg(field)
    fieldIdx <- switch(field,
                       major = 1L,
                       minor = 2L,
                       patch = 3L
    )
    assertthat::assert_that(is_integer_sv(value))
    increment_ptr(x, fieldIdx, value[1])
  }

#' @export
#' @rdname increment_version
increment_version.svlist <- function(x, field, value, ...){
  assertthat::assert_that(is_integer_sv(value))
  res <- Map(increment_version, x = x, field = field, value = value)
  `class<-`(res, "svlist")
}
