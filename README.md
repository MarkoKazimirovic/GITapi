
# GITapi - Seven Bridges Homework \| Marko Kazimirovic

## Installation

You can install the development version of GITapi from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("MarkoKazimirovic/GITapi")
```

Library support following functionalities:

-   Token authentication:

``` r
library(GITapi)
## Account and token made just for testing purposes
jemeljan <- tokenAuthentication(
                     userName = 'jemeljanPugacov',
                        token = "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"
                     )
```

    ## $user
    ## [1] "jemeljanPugacov"
    ## 
    ## $pass
    ## [1] "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"
    ## 
    ## $url
    ## [1] "https://api.github.com/user/repos"
    ## 
    ## $userAuth
    ## <request>
    ## Options:
    ## * httpauth: 1
    ## * userpwd: jemeljanPugacov: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
    ## 
    ## $response
    ## Response [https://api.github.com/user/repos]
    ##   Date: 2022-10-11 19:44
    ##   Status: 200
    ##   Content-Type: application/json; charset=utf-8
    ##   Size: 6.17 kB
    ## [
    ##   {
    ##     "id": 549790882,
    ##     "node_id": "R_kgDOIMUkog",
    ##     "name": "testingGITapi",
    ##     "full_name": "jemeljanPugacov/testingGITapi",
    ##     "private": true,
    ##     "owner": {
    ##       "login": "jemeljanPugacov",
    ##       "id": 115584040,
    ## ...

``` r
jemeljan$response
```

    ## Response [https://api.github.com/user/repos]
    ##   Date: 2022-10-11 19:44
    ##   Status: 200
    ##   Content-Type: application/json; charset=utf-8
    ##   Size: 6.17 kB
    ## [
    ##   {
    ##     "id": 549790882,
    ##     "node_id": "R_kgDOIMUkog",
    ##     "name": "testingGITapi",
    ##     "full_name": "jemeljanPugacov/testingGITapi",
    ##     "private": true,
    ##     "owner": {
    ##       "login": "jemeljanPugacov",
    ##       "id": 115584040,
    ## ...

-   Listing all repositories which the authenticated user has access to:

``` r
accesibleRepos <- listRepos(x = jemeljan)
```

    ## # A tibble: 1 x 2
    ##   availableRepositories Description      
    ##   <chr>                 <chr>            
    ## 1 testingGITapi         SevenBridges task

``` r
accesibleRepos
```

    ## # A tibble: 1 x 2
    ##   availableRepositories Description      
    ##   <chr>                 <chr>            
    ## 1 testingGITapi         SevenBridges task

-   Updating Description of some repository:

<!-- -->

    ## Warning: Unknown or uninitialised column: `user`.

    ## Warning: Unknown or uninitialised column: `userAuth`.

    ## $user
    ## [1] "jemeljanPugacov"
    ## 
    ## $pass
    ## [1] "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"
    ## 
    ## $url
    ## [1] "https://api.github.com/user/repos"
    ## 
    ## $userAuth
    ## <request>
    ## Options:
    ## * httpauth: 1
    ## * userpwd: jemeljanPugacov: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
    ## 
    ## $response
    ## Response [https://api.github.com/user/repos]
    ##   Date: 2022-10-11 19:44
    ##   Status: 200
    ##   Content-Type: application/json; charset=utf-8
    ##   Size: 6.17 kB
    ## [
    ##   {
    ##     "id": 549790882,
    ##     "node_id": "R_kgDOIMUkog",
    ##     "name": "testingGITapi",
    ##     "full_name": "jemeljanPugacov/testingGITapi",
    ##     "private": true,
    ##     "owner": {
    ##       "login": "jemeljanPugacov",
    ##       "id": 115584040,
    ## ...

    ## # A tibble: 1 x 2
    ##   availableRepositories Description      
    ##   <chr>                 <chr>            
    ## 1 testingGITapi         SevenBridges task

``` r
updateReposDescription(x = accesibleRepos,
                       reposToUpdate = "testingGITapi",
                       newDescription = "SevenBridges task")
```

    ## Warning: Unknown or uninitialised column: `user`.

    ## Warning: Unknown or uninitialised column: `userAuth`.

    ## Description of testingGITapi repos has been updated!

``` r
## Lets check message
accesibleRepos
```

    ## # A tibble: 1 x 2
    ##   availableRepositories Description      
    ##   <chr>                 <chr>            
    ## 1 testingGITapi         SevenBridges task

-   Listing usernames of collaborators for repository:

``` r
ReposCollaborator(x = accesibleRepos,
              repos = "testingGITapi")
```

    ## Warning: Unknown or uninitialised column: `user`.

    ## Warning: Unknown or uninitialised column: `userAuth`.

    ## [1] NA NA

-   Adding collaborators to repository:

``` r
addReposCollaborator(x = accesibleRepos,
                     repos = "testingGITapi",
                     collabName = "MarkoKazimirovic")
```

    ## Warning: Unknown or uninitialised column: `user`.

    ## Warning: Unknown or uninitialised column: `userAuth`.

    ## MarkoKazimirovic added as collaborator with push permission!
