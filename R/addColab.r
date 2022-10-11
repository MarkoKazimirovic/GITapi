#' Adding collaborators with custom permision level to the repository accessible
#' for the authenticated user. The function will check the existence of the proposed
#' collaborator (collabName) and throw an error if collabName is not existing.
#'
#' @param x First input is an object returned by listRepos().
#' @param repos Name of repository stated in the list of repositories available to the authenticated user.
#' @param collabName Existing collaborate user name on GIThub. Entering wrong name will cause error.name wil
#' @param permission One of the following permissions to be set: "pull", "triage", "push", "maintain", "admin." Default is "push"
#'
#' @return The message informs users about the successful adding of the collaborator or throws an error if the wrong repo names or non-existing collaborator are entered.
#' @export
#'
#' @examplesIf identical(Sys.getenv("IN_PKGDOWN"), "true")
#' addReposCollaborator(x = accesibleRepos,
#'                      repos = "markosThings",
#'                      collabName = "madicdsd")

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

collabCheck <- function(collabName){
  res <- httr::HEAD(url = httr::modify_url("https://api.github.com/",
                                           path = paste0("users/", as.character(collabName))))
  if(res$status_code != 200){
    stop(paste0("Stated collaborator ", as.character(collabName), " is not on GitHub!"), call. = FALSE)
  }
}
