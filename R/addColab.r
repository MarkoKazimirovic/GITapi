#' Title
#'
#' @param x
#' @param repos
#' @param collabName
#' @param permission
#'
#' @return
#' @export
#'
#' @examples
addReposCollaborator <- function(x, repos, collabName, permission = "push"){
  reposChecker(x, repos)
  if(!(as.character(permission) %in% c("pull", "triage", "push", "maintain", "admin"))) {
    permission <- "push"
  }
  collabCheck(collabName)
  httr::PUT(url = httr::modify_url("https://api.github.com/",
                                   path = paste0("repos/", x$user,"/", repos, "/collaborators/", collabName))
            , config = x$userAuth
            , body = list(permissions = permission)
            , encode = "json"
  )
  message(paste0(collabName, " added as collaborator with ", permission, " permission!"))
}
