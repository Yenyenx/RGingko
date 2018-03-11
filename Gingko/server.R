#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # accounts table
  output$accountsTable <- renderTable(mtcars)
  
  # operations table
  output$operationsTable <- renderDataTable({
    datatable(
      mtcars,
      options = list(pageLength = 50, lengthMenu = c(10, 25, 50, 100))
    )
  })

  output$SumOfOperations <- renderUI({HTML("<b>Sum:</b> 200.00")})
  output$NumberOfOperations <- renderUI({HTML("<b>Count:</b> 2")})
  
})