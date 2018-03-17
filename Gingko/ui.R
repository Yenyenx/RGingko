#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

# list of dependencies
library(futile.logger)
flog.threshold(INFO)

library(shiny)
#library(shinydashboard)
library(shinythemes)
library(shinyBS)

library(DT)
library(rhandsontable)
# devtools::install_github("jrowen/rhandsontable")
# https://antoineguillot.wordpress.com/2017/03/01/three-r-shiny-tricks-to-make-your-shiny-app-shines-33-buttons-to-delete-edit-and-compare-datatable-rows/
# https://github.com/AntoineGuillot2/ButtonsInDataTable
library(formattable)
library(sparkline)

#library(shinytester)

source('global.R')
source('globalFunctions.R')

source('overview.PanelContent.R')
source('operations.PanelContent.R')
source('accounts.PanelContent.R')
source('categories.PanelContent.R')
source('labels.PanelContent.R')

source('preferences.PanelContent.R')

shinyUI(
  ui = 
    tagList(
      #shinythemes::themeSelector(),
      navbarPage(
        theme = shinytheme("cerulean"),  # <--- To use a theme, uncomment this
        "Gingko",
        windowTitle = "Gingko",
        overview.MenuContent,
        operations.MenuContent,
        accounts.MenuContent,
        categories.MenuContent,
        labels.MenuContent,
        preferences.MenuContent
      )
    )
)

