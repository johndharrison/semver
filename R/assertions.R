is_character <- function(x){
  is.character(x)
}

assertthat::on_failure(is_character) <- function(call, env) {
  paste0(deparse(call$x), " should be an character vector.")
}

is_string <- function(x) {
  is.character(x) && length(x) == 1 && !is.na(x)
}

assertthat::on_failure(is_string) <-  function(call, env) {
  paste0(deparse(call$x), " is not a string")
}

is_integer <- function(x){
  is.integer(x)
}

assertthat::on_failure(is_integer) <- function(call, env) {
  paste0(deparse(call$x), " should be an integer value.")
}

is_string_sv <- function(x) {
  is.character(x) && length(x) == 1 && !is.na(x)
}

assertthat::on_failure(is_string_sv) <-  function(call, env) {
  paste0(
    deparse(call$x),
    " should be a character string for \"prerelease\" or \"build\"."
  )
}

is_integer_sv <- function(x){
  is.integer(x)
}

assertthat::on_failure(is_integer_sv) <- function(call, env) {
  paste0(
    deparse(call$x),
    " should be an integer for \"major\", \"minor\" or \"patch\".")
}

is_list <- function(x){
  is.list(x)
}

assertthat::on_failure(is_list) <- function(call, env){
  paste0(deparse(call$x), " is not a list")
}
