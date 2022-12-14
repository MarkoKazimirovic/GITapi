% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/collaborator.r
\name{ReposCollaborator}
\alias{ReposCollaborator}
\title{Listing the collaborators of the authenticated user on the repository
with the given name.}
\usage{
ReposCollaborator(x, repos = NULL)
}
\arguments{
\item{x}{First input is an object returned by listRepos().}

\item{repos}{Name of repository stated in the list of repositories available to the authenticated user.}
}
\value{
The vector with the names of collaborators on a given repository.
}
\description{
Listing the collaborators of the authenticated user on the repository
with the given name.
}
\examples{
\dontshow{if (identical(Sys.getenv("IN_PKGDOWN"), "true")) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
ReposCollaborator(x     = accesibleRepos,
                  repos = "someReposOnList")
\dontshow{\}) # examplesIf}
}
