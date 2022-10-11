#' Title
#'
#' @param x
#' @param repos
#'
#' @return
#' @export
#'
#' @examples
ReposCollaborator <- function(x, repos){
  reposChecker(x, repos)
  response <- httr::GET(url = httr::modify_url("https://api.github.com/",
                                   path = paste0("repos/", x$user,"/", repos, "/collaborators"))
                  , config = x$userAuth
  )
  parsedAPIresponse <- parser(response)
  collaborators <- fromParsed(parsedAPIresponse, "login")
}

collabCheck <- function(collabName){
  res <- httr::HEAD(url = httr::modify_url("https://api.github.com/",
                               path = paste0("users/", as.character(collabName))))
  if(res$status_code != 200){
    stop(paste0("Stated collaborator ", as.character(collabName), " is not on GitHub!"), call. = FALSE)
  }
}



