#' Listing the collaborators of the authenticated user on the repository
#' with the given name.
#'
#' @param x First input is an object returned by listRepos().
#' @param repos Name of repository stated in the list of repositories available to the authenticated user.
#'
#' @return The vector with the names of collaborators on a given repository.
#' @export
#'
#' @examplesIf identical(Sys.getenv("IN_PKGDOWN"), "true")
#' ReposCollaborator(x     = accesibleRepos,
#'                   repos = "someReposOnList")
#'
ReposCollaborator <- function(x, repos = NULL){
  reposChecker(x, repos)
  response <- httr::GET(url = httr::modify_url("https://api.github.com/",
                                   path = paste0("repos/", x$user,"/", repos, "/collaborators"))
                  , config = x$userAuth
  )
  parsedAPIresponse <- parser(response)
  collaborators <- fromParsed(parsedAPIresponse, "login")

  collaborators
}




