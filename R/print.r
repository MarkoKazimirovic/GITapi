#' Print the result of a GitHub API call
#'
#' @param x The result object from listRepos()
#' @param ... Other arguments to print generic.
#'
#' @return The tibble result with repos and description columns.
#' @export
#' @method print apiInfo

print.apiInfo <- function(x, ...) {
  tbl <- tibble::tibble(availableRepositories = x$accesibleRepos,
                        Description = x$reposDescription)
  print(tbl)
}
