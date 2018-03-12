require(shiny)
require(lubridate)

overview.MenuContent <- tabPanel(
  title = "Overview",  
  icon = icon("dashboard"),
  
  sidebarPanel(
    width = 2,
    
    helpText("help text goes here"),
    
    dateInput("Overview.StartDate", 
              "Start date:", 
              value = Sys.Date() - months(12)),
    
    dateInput("Overview.EndDate", 
              "End date:", 
              value = Sys.Date())
  ),
  
  mainPanel(
    width = 10,
    "This is left blank."
  )
)