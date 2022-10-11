source("R/updateReposDescription.r")

ReposCollaborator <- function(x, repos){
  reposChecker(x, repos)
  response <- httr::GET(url = httr::modify_url("https://api.github.com/",
                                   path = paste0("repos/", x$user,"/", repos, "/collaborators"))
                  , config = x$userAuth
  )
  collaborators <- parser(response)[[1]]$login ## check
}

collabCheck <- function(collabName){
  res <- httr::HEAD(url = httr::modify_url("https://api.github.com/",
                               path = paste0("users/", as.character(collabName))))
  if(res$status_code != 200){
    stop(paste0("Stated collaborator ", as.character(collabName), " is not on GitHub!"), call. = FALSE)
  }
}

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


