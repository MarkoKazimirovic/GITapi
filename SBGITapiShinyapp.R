library(shiny)
library(GITapi)
library(DT)
library(tibble)


## UI auth
applicationUI <- function(id) {
  ns <- NS(id) # namespace
  tagList(
    textInput(ns("username"),
              label = "User name",
              value = "",
              width = NULL,
              placeholder = NULL),
    textInput(ns("token"),
              label = "Token",
              value = "",
              width = NULL,
              placeholder = NULL),
    actionButton(ns("button"), label = "authentification"),
    verbatimTextOutput(ns("out")),
    DT::dataTableOutput(ns('table'))


  )
}

## 1st module
authServer <-
    function(input, output, session) {

      observeEvent(input$button, {
        validate(need(input$username,
                      input$token,
                      message = FALSE))

        user <- tryCatch(tokenAuthentication(input$username,
                                             input$token),
                 error = function(e) {
                   print(unlist(e))
                 })

        output$out <- renderText({
          if(is.list(user)){
            "Authentification successful!"
          } else {
            user
          }
        })

        if(is.list(user)){
        accesibleRepos <- listRepos(x = user)

        output$table = DT::renderDataTable({
         data.frame(accesibleRepos$accesibleRepos,
                 accesibleRepos$reposDescription)

        })
        }

      })

    }


####
ui <- fluidPage(
    titlePanel("GITHUB communication panel"),
        applicationUI("UserAuthentification")
)

server <- function(input, output, session) {
  callModule(authServer, "UserAuthentification")
  }


# Run the application
shinyApp(ui = ui,
         server = server)
