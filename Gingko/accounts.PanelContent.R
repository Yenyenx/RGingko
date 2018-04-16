require(shiny)

accounts.MenuContent <- tabPanel(
  title = "Accounts",  
  icon = icon("table"),
  
  sidebarPanel(
    width = 2,
    
    helpText("help text goes here")
    
  ), # end of sidebarPanel
  
  mainPanel(
    width = 10,
    
    tabsetPanel(
      
      tabPanel(
        "Accounts",
        
        div(
          tableOutput("accounts.GlobalTable"),
          style = "font-size:80%"
        )
        
      ), # end of Accounts
      
      tabPanel(
        "New Account",
        br(),
        
        checkboxInput("newAccount.IsAnalytical",
                      label = "Is analytical ?",
                      value = FALSE),
        
        selectInput("newAccount.SelectedAgency", 
                    "Choose a bank agency:", 
                    width = '100%',
                    list('Analytical account')),
        
        textInput("newAccount.Name",
                  label = "Account name:",
                  value = "my account",
                  width = "100%"),
        
        numericInput("newAccount.Id",
                     label = "Account number:",
                     value = 0L,
                     min = 0L,
                     step = 1L,
                     width = "100%"),
        
        dateInput("newAccount.CreationDate", 
                  label = "Creation date:", 
                  value = Sys.Date()),
        
        bsButton("newAccount.Create", 
                 label = "Create new Account",
                 style = "warning")
        
      ), # end of New Account
      
      tabPanel(
        "Bank Agencies",
        br(),
        div(
          DT::dataTableOutput("agencies.GlobalTable"),
          style = "font-size:80%"
        ),
        
        br(),
        bsButton("agencies.Delete", 
                 label = "Delete selected agencies",
                 style = "warning")
      ), # end of Bank agencies
      
      tabPanel(
        "New Bank Agency",
        br(),
        
        textInput("newAgency.Bank",
                  label = "Bank name:",
                  value = "my bank",
                  width = "100%"),
        
        numericInput("newAgency.BankId",
                     label = "Bank id:",
                     value = 0L,
                     min = 0L,
                     max = 99999L,
                     step = 1L,
                     width = "100%"),
        
        textInput("newAgency.AgencyName",
                  label = "Agency name:",
                  value = "my Agency",
                  width = "100%"),
        
        numericInput("newAgency.GuichetCode",
                     label = "Guichet Code:",
                     value = 0L,
                     min = 0L,
                     max = 99999L,
                     step = 1L,
                     width = "100%"),
        
        bsButton("newAgency.Create", 
                 label = "Create new Agency",
                 style = "warning")
        
      ) # end of New Bank Agency
    ) # end of tabsetPanel
  ) # end of mainPanel
)