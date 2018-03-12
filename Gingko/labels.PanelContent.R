require(shiny)

labelsList.PanelContent <- tabPanel(
  title = "Label list",  
  icon = icon("table"),
  "This panel is intentionally left blank for label list"
)

newLabel.PanelContent <- tabPanel(
  title = "Create new label...",  
  icon = icon("plus", lib = "glyphicon"),
  "This panel is intentionally left blank to create new label"
)

labels.MenuContent <- navbarMenu(
  "Labels",
  labelsList.PanelContent,
  newLabel.PanelContent
)