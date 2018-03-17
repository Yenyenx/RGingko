require(shiny)

labelsList.PanelContent <- tabPanel(
  title = "Label list",
  icon = icon("table"),
  "This panel is intentionally left blank for label list"
)

newLabel.PanelContent <- tabPanel(
  title = "New label...",
  icon = icon("plus", lib = "glyphicon"),
  
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
    value = "blablabla",
    width = "80%",
    resize = "both"
  ),
  
  bsButton("newLabel.Create", 
           label = "Create new Label",
           style = "warning")
  
)

labels.MenuContent <- navbarMenu("Labels",
                                 labelsList.PanelContent,
                                 newLabel.PanelContent)