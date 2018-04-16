require(shiny)

labelsList.PanelContent <- tabPanel(
  title = "Label list",
  icon = icon("table"),
  "This panel is intentionally left blank for label list"
)

newLabel.PanelContent <- tabPanel(
  title = "New label...",
  icon = icon("plus", lib = "glyphicon"),
  width = 12,
  
  helpText("help text goes here"),
  
  textInput(
    "newLabel.Name",
    label = "Label name:",
    value = "my label",
    width = "100%"
  ),
  
  textAreaInput(
    "newLabel.Description",
    label = "Description:",
    value = "Enter here the description of the label",
    width = "100%",
    resize = "vertical"
  ),
  
  bsButton("newLabel.Create", 
           label = "Create new Label",
           style = "warning")
  
)

labels.MenuContent <- navbarMenu("Labels",
                                 labelsList.PanelContent,
                                 newLabel.PanelContent)