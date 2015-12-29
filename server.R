
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
  # Seems like the easiest way to do a surface is with a matrix, rather than defining x, y, z manually
  surfaceVals <- reactive({
    dplyr::select(as.data.frame(loans), delinq_2yrs, int_rate, loan_amnt) %>%
      dcast(int_rate ~ delinq_2yrs, fun.aggregate = sum, value.var = "loan_amnt") %>%
      as.matrix()
  })
  output$surfaceChart <- renderPlotly({
    plot_ly(z = surfaceVals(), type = "surface", contours = list(y = list(show = TRUE)), lighting = list(ambient = 1, diffuse = 1, roughness = 1))
  })
  
  #### ==== Tab 3 (Maps) ==== ####
  stateVals <- reactive({balSummary(loans, "addr_state")})
  output$stateMapChart <- renderPlotly({
    plot_ly(stateVals(), z = bal, locations = addr_state, type = 'choropleth', locationmode = 'USA-states', color = bal, colors = "Purples") %>% 
      layout(title = 'Loan Amounts by State', geo = usaOpts) 
  })
  
  #### ==== Tab 4 (Data Points) ==== ####
  correlation <- matrix(c(1, .75, .75,.75, 1, .75,.75, .75, 1), ncol = 3)
  obs <- mvtnorm::rmvnorm(200, sigma = correlation) # use the mvtnorm package to sample 200 observations
  df <- setNames(data.frame(obs), c("x", "y", "z")) # collect everything in a data-frame
  
  output$copulaChart <- renderPlotly({plot_ly(df, x = x, y = y, z = z, type = "scatter3d", mode = "markers", color = x)})
  
  #### ==== Tab 5 (Stats) ==== ####
  output$statsBoxChart <- renderPlotly({plot_ly(loans, y = loan_amnt, color = purpose, type = "box")})
})
