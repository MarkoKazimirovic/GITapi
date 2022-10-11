#' Print the result of a GitHub API call
#'
#' @param x The result object from listRepos()
#' @param ...Ignored.
#'
#' @importFrom tibble
#' @return The tibble result with repos and description columns.
#' @export
#' @method print apiInfo

print.apiInfo <- function(x, ...) {
  tbl <- tibble::tibble(d = x$accesibleRepos,
                        Description = x$reposDescription)
  print(tbl)
}
