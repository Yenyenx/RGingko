#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# list of dependencies
library(shiny)
library(shinydashboard)
library(DT)
library(rhandsontable)
# devtools::install_github("jrowen/rhandsontable")
# https://antoineguillot.wordpress.com/2017/03/01/three-r-shiny-tricks-to-make-your-shiny-app-shines-33-buttons-to-delete-edit-and-compare-datatable-rows/
# https://github.com/AntoineGuillot2/ButtonsInDataTable
library(formattable)
library(sparkline)

#library(shinytester)


################################################
# sidebar
sidebar <- dashboardSidebar(
  sidebarMenu(
    menuItem("Overview", 
             tabName = "overview", 
             icon = icon("dashboard")
    ),
    
    menuItem("Operations", 
             tabName = "operations", 
             icon = icon("table")
    ),
    
    menuItem("Accounts", 
             tabName = "accounts",
             icon = icon("table")
    ),
    
    menuItem("Categories", 
             tabName = "categories",
             icon = icon("table")
    ),
    
    menuItem("Parameters", 
             icon = icon("cog", lib = "glyphicon"), 
             tabName = "parameters"
    )
  )
)

source('overview.TabContent.R')
source('operations.TabContent.R')
source('accounts.TabContent.R')
source('parameters.TabContent.R')

body <- dashboardBody(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
  ),
  
  tabItems(
    overview.TabContent,
    operations.TabContent,
    accounts.TabContent,
    parameters.TabContent
  ) 
)  

#############################################################
# Define UI for StreetLight
shinyUI(
  dashboardPage(skin = "green",
                dashboardHeader(title = span(tagList(icon("bar-chart"), "Gingko"))),
                sidebar,
                body)
)