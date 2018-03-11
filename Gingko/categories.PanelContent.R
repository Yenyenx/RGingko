require(shiny)

categories.PanelContent <- tabPanel(
  title = "Categories",  
  icon = icon("table"),
  
  mainPanel(
   width = 6,
   
   helpText("help text goes here"),
   dataTableOutput("Categories.List")
  ),
  
  mainPanel(
    width = 6,
    helpText("help text goes here"),
    dataTableOutput("Categories.SubCategories.List")
  )
)