is_character <- function(x){
  is.character(x)
}

assertthat::on_failure(is_character) <- function(call, env) {
  paste0(deparse(call$x), " should be an character vector.")
}
