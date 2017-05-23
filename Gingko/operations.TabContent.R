require(shiny)
require(shinydashboard)
require(DT)

operations.TabContent <- tabItem(
  tabName = "operations",
  
  fluidPage(
    fluidRow(
      helpText("help text goes here.")
    ),
    fluidRow(
      
      column(2, style='padding:1px;',
             dateInput("StartDate", "StartDate:", value = "2012-01-01")
      ),
      
      column(2, style='padding:1px;',
             dateInput("EndDate", "EndDate:", value = "2015-01-01")
      ),
      
      column(6, style='padding:1px;',
             selectInput("SelectedAccount", 
                         "Choose an account:", 
                         width = '100%',
                         list('CC ING TEST')
             )
      ),
      
      column(2, style='padding:10px;', align= 'right',
             htmlOutput("SumOfOperations"),
             htmlOutput("NumberOfOperations")
      )
    ),
    
    fluidRow(
      div(
        DT::dataTableOutput("operationsTable"),
        style = "font-size:80%"
      )
    )
  )
  
)