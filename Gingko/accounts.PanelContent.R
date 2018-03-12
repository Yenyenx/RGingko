require(shiny)

accounts.MenuContent <- tabPanel(
  title = "Accounts",  
  icon = icon("table"),
  
  sidebarPanel(
    width = 2,
    
    helpText("help text goes here")
    
  ), # end of sidebarPanel
  
  mainPanel(
    width = 10,
    
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
  ) # end of mainPanel
)