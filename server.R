
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(plotly)
source("helper.R")

shinyServer(function(input, output) {
  source("global.R")
  
  #### ==== Tab 1 (Bar Charts) ==== ####
  purpVals <- reactive({balSummary(loans, "purpose")})
  output$purpChart <- renderPlotly({plot_ly(data = purpVals(), y = bal, x = purpose, type = "bar")})
  # To swap for horizontal, note we also swap x <-> y, it's not automatic like rCharts
  output$purpHorizChart <- renderPlotly({plot_ly(data = purpVals(), x = bal, y = purpose, type = "bar", orientation = "h")})
  
  gradeVals <- reactive({dplyr::select(loans, grade, sub_grade, loan_amnt)})
  output$gradeChart <- renderPlotly({plotStackedBarChart(gradeVals(), "grade", "loan_amnt", "sub_grade")})
  
  #### ==== Tab 2 (Surfaces) ==== ####
})
