#' @export
print.svptr <- function(x, ...){
  x <- render_ptr(x)
  major <- x[[1]]
  minor <- x[[2]]
  patch <- x[[3]]
  prerelease <- x[[4]]
  build <- x[[5]]
  cat("Maj:", major, "Min:", minor, "Pat:", patch)
  if(!identical(prerelease, "")){
    cat(" Pre:", prerelease)
  }
  if(!identical(build, "")){
    cat(" Bld:", build)
  }
  cat("\n")
}

#' @export
print.svlist <- function(x, ...){
  for(i in seq_along(x)){
    cat(paste0("[", i, "] "))
    print(x[[i]])
    cat("\n")
  }
}

#' @export
`[.svlist` <- function(x, i, ...){
  res <- .Primitive("[")(unclass(x), i)
  return(`class<-`(res, "svlist"))
}

#' @export
`$.svptr` <- function(x, name = c("major", "minor", "patch",
                                  "prerelease", "build"), ...){
  name <- match.arg(name)
  render_ptr(x)[[name]]
}

#' @export
as.character.svptr <- function(x, ...){
  version <- render_ptr(x)
  res <- paste(version[1:3], collapse = ".")
  if(version[4] != ""){
    res <- paste(res, version[4], sep = "-")
  }
  if(version[5] != ""){
    res <- paste(res, version[5], sep = "+")
  }
  res
}

#' @export
as.character.svlist <- function(x, ...){
  vapply(x, as.character, character(1))
}

#' @export
as.data.frame.svlist <- function(x, ..., stringsAsFactors = FALSE){
  svrender <- vapply(x, render_ptr, character(5))
  svrender <- as.data.frame(t(svrender), ...,
                            stringsAsFactors = stringsAsFactors)
  svrender[c("major", "minor", "patch")] <-
    lapply(svrender[c("major", "minor", "patch")], as.integer)
  svrender
}

#' @export
Ops.svptr <- function(e1, e2){
  if (nargs() == 1){
    stop(gettextf("unary %s not defined for \"svptr\" objects",
                  .Generic), domain = NA)}
  boolean <- switch(.Generic, `<` = , `>` = , `==` = , `!=` = ,
                    `<=` = , `>=` = TRUE, FALSE)
  if (!boolean)
    stop(gettextf("%s not defined for \"svptr\" objects",
                  .Generic), domain = NA)
  if(!inherits(e1, "svptr")){
    e1 <- parse_version(e1)[[1]]
  }
  if(!inherits(e2, "svptr")){
    e2 <- parse_version(e2)[[1]]
  }
  op <- switch(.Generic, `<` = '<',  `>` = '>', `==` = '=', `!=` = '!=',
               `<=` = '<=', `>=` = '>=')
  e1 <- ptr_comparator(e1, e2)
  e2 <- 0L
  NextMethod(.Generic)
}


#' @export
Ops.svlist <- function(e1, e2){
  if (nargs() == 1){
    stop(gettextf("unary %s not defined for \"svlist\" objects",
                  .Generic), domain = NA)}
  boolean <- switch(.Generic, `<` = , `>` = , `==` = , `!=` = ,
                    `<=` = , `>=` = TRUE, FALSE)
  if (!boolean)
    stop(gettextf("%s not defined for \"svlist\" objects",
                  .Generic), domain = NA)
  FUN <- get(.Generic, envir = parent.frame(), mode = "function")
  unlist(Map(FUN, e1 = e1, e2 = e2))
}

#' @export
Summary.svlist <- function(x, ..., na.rm = FALSE){
  ok <- switch(.Generic, max = , min = , range = TRUE, FALSE)
  if (!ok)
    stop(gettextf("%s not defined for \"svlist\" objects",
                  .Generic), domain = NA)
  sorted <- sort(x)
  switch(.Generic,
         max = sorted[[length(sorted)]],
         min = sorted[[1]],
         range = `class<-`(c(sorted[1], sorted[length(sorted)]), "svlist")
  )
}

#' @export
.DollarNames.svptr <- function(x, pattern = ""){
  grep(pattern, c("major", "minor", "patch", "prerelease", "build"),
       value = TRUE)
}
