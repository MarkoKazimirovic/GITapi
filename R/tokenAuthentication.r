textCheck <- function(userName, token){
  if(!is.character(userName) || !length(userName) == 1 || grepl("\\W", userName)){
    stop("User name is not entered properly!", call. = FALSE)
  }
  if(!is.character(token) || !length(token) == 1 || grepl("\\W", token)){
    stop("Token is not entered properly!", call. = FALSE)
  }
  list(user  = userName,
       pass  = token,
       url = modify_url("https://api.github.com/",
                        path = paste0("user/repos"))
  )
}

statusCheck <- function(APIresponse){
  if(APIresponse$status_code == 401 || length(content(APIresponse)) == 0) {
    stop("Unauthorized acces with invalid user name or password", call. = FALSE)
  } else if (APIresponse$status_code != 200){
    stop("Something went wrong", call. = FALSE)
  } else if (http_type(APIresponse) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
}

tokenAuthentication <- function(userName, token){
  cred <- textCheck(userName, token)
  userAuth <- authenticate(cred$user,
                           cred$pass)
  response <- GET(url = cred$url
                  , config = userAuth
                  # , query = list(visibility= "all")
  )
  statusCheck(response)
  c(cred,
    userAuth = list(userAuth),
    response = list(response))
}
