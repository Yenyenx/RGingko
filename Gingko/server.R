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
library(readr)
library(DT)

summary_iris <- group_by(iris, Species) %>% summarise(Count = n())

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  ##### accounts #################################
  # accounts table
  output$accounts.GlobalTable <- renderTable(mtcars)
  
  # newAgency.Create: create new agency
  observeEvent(  
    input$newAgency.Create,
    {
      newAgency.Bank <- isolate({ input$newAgency.Bank })
      newAgency.BankId <- isolate({ input$newAgency.BankId })
      newAgency.AgencyName <- isolate({ input$newAgency.AgencyName })
      newAgency.GuichetCode <- isolate({ input$newAgency.GuichetCode })
      
      df <- data.frame(
        Key = paste(newAgency.BankId, newAgency.GuichetCode, sep = '-'),
        Bank = newAgency.Bank,
        BankId = newAgency.BankId,
        AgencyName = newAgency.AgencyName,
        GuichetCode = newAgency.GuichetCode
      )
      
      tryCatch({
        
        if(!file.exists(global.options$file.names$bank.agencies)) {
          write_csv(df[-1,], path = global.options$file.names$bank.agencies)
        }
        
        file.copy(from = global.options$file.names$bank.agencies,
                  to = global.options$file.names$backup.bank.agencies,
                  overwrite = T, copy.date = F)
        
        bank.agencies <- read_csv(file = global.options$file.names$bank.agencies,
                                  col_names = T)
        # look for duplicate...
        stopifnot( !(df$Key %in% bank.agencies$Key) )
        
        write_csv(rbind(bank.agencies, df),
                  path = global.options$file.names$bank.agencies,
                  col_names = T,
                  append = F)
        
        showModal(modalDialog(
          title = "New Agency",
          "A new bank agency has been successfully added!",
          easyClose = TRUE,
          size = 's'
        ))
      },
      
      error = function(e) {
        file.copy(
          from = global.options$file.names$backup.bank.agencies,
          to = global.options$file.names$bank.agencies,
          overwrite = T, copy.date = F)
        
        showModal(modalDialog(
          title = "New Agency",
          paste("An error has occured!", e, sep = "\n"),
          easyClose = TRUE,
          size = 'm'
        ))
      },
      
      finally = {
        # remove bup file if it exists...
        if(file.exists(global.options$file.names$backup.bank.agencies)) {
          file.remove(global.options$file.names$backup.bank.agencies)
        }
      })
      
    }
  )
  
  agenciesReader <- reactiveFileReader(intervalMillis = 1000,
                                       filePath = global.options$file.names$bank.agencies,
                                       readFunc = function(x){read_csv(x,col_names = T)},
                                       session = session)
  
  output$agencies.GlobalTable <- DT::renderDataTable(
    agenciesReader(),
    selection = list(mode = 'single',
                     target = 'row'),
    options = list(dom = 't',
                   focus = 'click',
                   fixedHeader = TRUE))
  
  # agencies.Delete
  observeEvent(  
    input$agencies.Delete,
    {
      showModal(modalDialog(
          title = "Delete Agency",
          "...",
          easyClose = TRUE,
          size = 's'
        ))
    }
  )
  
  
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