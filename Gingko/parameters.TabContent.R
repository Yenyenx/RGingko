require(shiny)
require(shinydashboard)

parameters.TabContent <- tabItem(
  tabName = "parameters",
  fluidPage(
    h2("Global parameters"),
    textInput("data.folder", "Data folder:", value= "./data")
  )
)