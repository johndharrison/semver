#' Set version field
#'
#' Set the version field. "Major", "minor" and "patch" fields are set as
#'     integers, "prerelease" and "build" are set with character strings.
#' @param x An object of class "svlist" or "svptr".
#' @param ... Additional arguments passed on to methods.
#'
#' @return returns an object of class svptr or svlist
#' @export
#'
#' @examples

set_version <- function(x, ...){
  UseMethod("set_version")
}

#' @export
#' @rdname set_version
#' @param field For the "svptr" class a character string detailing the field to
#'     set (major, minor etc...). For the "svlist" class a character vector
#'     detailing the field to set for each list member.
#' @param value The value to set the field to. For fields "major", "minor"
#'     and "patch" this is an integer. For fields "prerelease" and "build"
#'     this is a character. For the "svptr" class value is a scalar. For
#'     the "svlist" class value is a list detailing the value to set for
#'     each list member.
set_version.svptr <- function(x, field = c("major", "minor", "patch",
                                       "prerelease", "build"), value){
  field <- match.arg(field)
  fieldIdx <- switch(field,
                  major = 1L,
                  minor = 2L,
                  patch = 3L,
                  prerelease = 4L,
                  build = 5L
  )
  if(fieldIdx < 4L){
    assertthat::assert_that(is_integer(value))
  }else{
    assertthat::assert_that(is_string(value))
  }
  set_ptr(x, fieldIdx, value[1])
}
