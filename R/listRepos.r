parser <- function(x){
  jsonlite::fromJSON(content(x, "text"),
                     simplifyVector = FALSE)
}
fromParsed <- function(x, endpoint){
  vapply(x, "[[", "", endpoint)
}

listRepos <- function(x){
  parsedAPIresponse <- parser(x$response)
  structure(
    list(
      user = x$user,
      userAuth = x$userAuth,
      accesibleRepos = fromParsed(parsedAPIresponse, "name"),
      reposDescription = fromParsed(parsedAPIresponse, "description")
    ),
    class = "apiInfo"
  )
}

print.apiInfo <- function(x, ...) {
  tbl <-(tibble::tibble(d = x$accesibleRepos,
                        Description = x$reposDescription))
  print(tbl)
}
