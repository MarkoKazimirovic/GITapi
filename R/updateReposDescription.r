#' Title
#'
#' @param x
#' @param reposToUpdate
#' @param newDescription
#'
#' @return
#' @export
#'
#' @examples
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


