#'Token authentication
#'
#'This function checks if the given credentials are entered properly to enable the connection to the JSON file.
#'Submitting a non-existing user-name or token will result in an unauthorized access error.
#'Function intentionally forces the user to enter proper credentials.
#'
#' @param userName Must be entered as a single string without whitespace, the violation will throw a dedicated error.
#' @param token Must be entered as a single string without whitespace, the violation will throw a dedicated error.
#'
#' @return tokenAuthentication() for authenticated user return a list of credentials (user-name, token, url) along with httr authentication() and response() objects
#' @export
#'
#' @examplesIf identical(Sys.getenv("IN_PKGDOWN"), "true")
#' ## Wrong entered credintials
#' tokenAuthentication("Mickey mouse", ".")

tokenAuthentication <- function(userName = NULL, token= NULL){
  cred <- textCheck(userName, token)
  userAuth <- httr::authenticate(cred$user,
                           cred$pass)
  response <- httr::GET(url = cred$url
                        , config = userAuth
  )
  statusCheck(response)
  c(cred,
    userAuth = list(userAuth),
    response = list(response))
}

textCheck <- function(userName, token){
  if(!is.character(userName) || length(userName) != 1 || grepl("\\W", userName)){
    stop("User name is not entered properly!", call. = FALSE)
  }
  if(!is.character(token) || length(token) != 1 || grepl("\\W", token)){
    stop("Token is not entered properly!", call. = FALSE)
  }
  list(user  = userName,
       pass  = token,
       url   = "https://api.github.com/user/repos"
  )
}

statusCheck <- function(APIresponse){
  if(APIresponse$status_code == 401 || length(httr::content(APIresponse)) == 0) {
    stop("Unauthorized access with invalid user name or password", call. = FALSE)
  } else if (APIresponse$status_code != 200){
    stop("Something went wrong", call. = FALSE)
  } else if (httr::http_type(APIresponse) != "application/json") {
    stop("API did not return json", call. = FALSE)
  }
}




