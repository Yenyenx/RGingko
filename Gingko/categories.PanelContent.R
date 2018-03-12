require(shiny)

categories.PanelContent <- tabPanel(
  title = "Categories",  
  icon = icon("table"),
  
  mainPanel(
    width = 6,
    helpText("help text goes here"),
    DT::dataTableOutput("Categories.List")
  ),
  
  mainPanel(
    width = 6,
    helpText("help text goes here"),
    DT::dataTableOutput("Categories.SubCategories.List")
  )
)

subcategories.PanelContent <- tabPanel(
  title = "Sub-categories",  
  icon = icon("table"),
  "This is left blanck"
)

newCategory.PanelContent <- tabPanel(
  title = "Create new category...",  
  icon = icon("plus", lib = "glyphicon"),
  "This is left blanck"
)

newSubCategory.PanelContent <- tabPanel(
  title = "Create new sub-category...",  
  icon = icon("plus", lib = "glyphicon"),
  "This is left blanck"
)

categories.MenuContent <- 
  navbarMenu(
    "Categories",
    categories.PanelContent,
    subcategories.PanelContent,
    newCategory.PanelContent,
    newSubCategory.PanelContent
  )