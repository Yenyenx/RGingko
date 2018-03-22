#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(tidyr)
library(DT)

summary_iris <- group_by(iris, Species) %>% summarise(Count = n())

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  # accounts table
  output$accounts.GlobalTable <- renderTable(mtcars)
  
  # operations table
  # https://rstudio.github.io/DT/shiny.html
  output$Operations.Table <- renderDataTable({
    datatable(
      mtcars,
      extensions = c('Buttons','FixedHeader'),
      options = list(pageLength = 50, 
                     lengthMenu = list(c(25, 50, 100, -1), c(25, 50, 100, 'All')),
                     dom = "Blfrtip",
                     buttons = c('copy'),
                     focus = 'click',
                     fixedHeader = TRUE,
                     rowCallback = DT::JS(
                       'function(row, data) {
                       // Bold cells for those >= 19 in the first column
                       if (parseFloat(data[1]) > 19.0) {
                       $("td:eq(1)", row).css("color", "tomato");
                       $("td:eq(1)", row).css("font-weight", "bold");
                       }
                       if (parseFloat(data[1]) < 19.0) {
                       $("td:eq(1)", row).css("color", "MediumSeaGreen");
                       $("td:eq(1)", row).css("font-weight", "bold");
                       }

                       }'
                     )
      ),
      selection = 'single'
    )
  })
  
  output$Operations.SumOfOperations <- renderUI({HTML("<b>Total:</b> 200.00")})
  output$Operations.NumberOfOperations <- renderUI({HTML("<b>Count:</b> 2")})
  output$Operations.MaxOfOperations <- renderUI({HTML("<b>Max:</b> 200.00")})
  output$Operations.MinOfOperations <- renderUI({HTML("<b>Min:</b> 0.00")})
  
  # categories
  output$Categories.List <- DT::renderDataTable(summary_iris,
                                                selection = list(mode = 'single', 
                                                                 target = 'row'))
  
  # subset the records to the row that was clicked
  drilldata <- reactive({
    shiny::validate(
      need(length(input$summary_rows_selected) > 0, "Select rows to drill down!")
    )
    # subset the summary table and extract the column to subset on
    # if you have more than one column, consider a merge instead
    # NOTE: the selected row indices will be character type so they
    #   must be converted to numeric or integer before subsetting
    selected_species <- summary_iris[as.integer(input$summary_rows_selected), ]$Species
    iris[iris$Species %in% selected_species, ]
  })
  
  # display the subsetted data
  output$Categories.SubCategories.List <- DT::renderDataTable(iris,
                                                              selection = list(mode = 'single', 
                                                                               target = 'row'))
  
  # to allow killing the app once the browser is closed.
  # helpful for dev session.
  session$onSessionEnded(stopApp)
  
})