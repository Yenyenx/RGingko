require(shiny)
require(DT)

operations.PanelContent <- tabPanel(
  title = "Operations",  
  icon = icon("line-chart"),
  
  sidebarPanel(
    width = 2,
    
    helpText("help text goes here"),
    
    dateInput("StartDate", 
              "StartDate:", 
              value = "2012-01-01"),
    
    dateInput("EndDate", 
              "EndDate:", 
              value = "2015-01-01"),
    
    selectInput("SelectedAccount", 
                "Choose an account:", 
                width = '100%',
                list('CC ING TEST')
    ),
    
    htmlOutput("SumOfOperations"),
    htmlOutput("NumberOfOperations")
    
  ),
  
  mainPanel(
    width = 10,
    
    div(
      DT::dataTableOutput("operationsTable"),
      style = "font-size:80%"
    )
  )
)