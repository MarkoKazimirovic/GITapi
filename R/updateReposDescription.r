#' The function allow the authenticated user to update description of repository from list.
#'
#' @param x First input is an object returned by listRepos().
#' @param reposToUpdate Name of repository stated in the list of repositories available to the authenticated user.
#' @param newDescription New description for selected repository.
#'
#' @return The message informs users about the successful update or throws an error if the wrong repos names are entered.
#' @export
#'
#' @examplesIf identical(Sys.getenv("IN_PKGDOWN"), "true")
#' updateReposDescription(x = accesibleRepos,
#'                        reposToUpdate = "someReposOnList",
#'                        newDescription = "SevenBridges task")
#'
updateReposDescription <- function(x, reposToUpdate, newDescription){
  reposChecker(x, reposToUpdate)
  httr::PATCH(
    url = httr::modify_url("https://api.github.com/",
                     path = paste0("repos/", x$user,"/", reposToUpdate))
    , config =  x$userAuth
    , body = list(description = as.character(newDescription) )
    , encode = "json"
  )
  message(paste0("Description of ", reposToUpdate, " repos has been updated!"))
}

reposChecker <- function(x, reposToUpdate) {
  if (!(as.character(reposToUpdate) %in% x$accesibleRepos)) {
    stop("Stated repos in not on the list of available repos!", call. = FALSE)
  }
}


