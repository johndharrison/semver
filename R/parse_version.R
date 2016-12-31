#' Title
#'
#' @param version
#'
#' @return
#' @export
#'
#' @examples

parse_version <- function(version){
  assertthat::assert_that(is.character(version))
  parse_ptr(version)
}
