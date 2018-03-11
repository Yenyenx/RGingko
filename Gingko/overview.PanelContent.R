require(shiny)
# require(shinydashboard)

overview.PanelContent <- tabPanel(
  title = "Overview",  
  icon = icon("dashboard"),
  
  sidebarPanel(
    width = 2,
    
    helpText("help text goes here"),
    
    dateInput("Overview.StartDate", 
              "StartDate:", 
              value = Sys.Date() - months(12)),
    
    dateInput("Overview.EndDate", 
              "EndDate:", 
              value = Sys.Date())
    
  ),
  
  mainPanel(
    width = 10,
    "This is left blank."
  )
)