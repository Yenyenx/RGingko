require(shiny)
require(DT)
require(lubridate)

operations.MenuContent <- tabPanel(
  title = "Operations",  
  icon = icon("line-chart"),
  
  sidebarPanel(
    width = 2,
    
    helpText("help text goes here"),
    
    dateInput("Operations.StartDate", 
              "Start date:", 
              value = Sys.Date() - months(12)),
    
    dateInput("Operations.EndDate", 
              "End date:", 
              value = Sys.Date()),
    
    selectInput("Operations.SelectedAccount", 
                "Choose an account:", 
                width = '100%',
                list('CC ING TEST')
    ),
    
    htmlOutput("Operations.NumberOfOperations"),
    htmlOutput("Operations.SumOfOperations"),
    htmlOutput("Operations.MaxOfOperations"),
    htmlOutput("Operations.MinOfOperations")
    
  ),
  
  mainPanel(
    width = 10,
    
    div(
      DT::dataTableOutput("Operations.Table"),
      style = "font-size:80%"
    )
  )
)