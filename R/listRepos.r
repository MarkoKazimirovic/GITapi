#' Title
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
listRepos <- function(x){
  parsedAPIresponse <- parser(x$response)
  structure(
    list(
      user = x$user,
      userAuth = x$userAuth,
      accesibleRepos = fromParsed(parsedAPIresponse,
                                  "name"),
      reposDescription = fromParsed(parsedAPIresponse,
                                    "description")
    ),
    class = "apiInfo"
  )
}

parser <- function(x){
  jsonlite::fromJSON(httr::content(x, "text"),
                     simplifyVector = FALSE)
}

fromParsed <- function(x, endpoint){
  info <- list()
  for(i in 1:length(x)){
    info[i] <- x[[i]][match(endpoint,
                            names(x[[i]]))]
    if(is.null(info[[i]])) info[[i]] <- " "
  }
  unlist(info)
}
