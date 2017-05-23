require(shiny)
require(shinydashboard)
require(DT)

accounts.TabContent <- tabItem(
  tabName = "accounts",
  
  fluidPage(
    fluidRow(
      helpText("help text goes here")
    ),
    
    fluidRow(
      tabsetPanel(
        tabPanel(
          "Accounts",
          div(
            tableOutput("accountsTable"),
            style = "font-size:80%"
          )
        ),
        
        tabPanel(
          "New Account",
          textInput("newAccountName",
                    label = "Account name:",
                    value = "New Account",
                    width = "100%")
        )
      )
    )
  )
)