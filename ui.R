
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(shinydashboard)

barUI <-  tabItem(tabName = "bars", fluidPage(
  fluidRow(
    column(6, plotlyOutput("purpChart")),
    column(6, plotlyOutput("purpHorizChart"))),
  fluidRow(plotlyOutput("gradeChart"))
  )
)


sidebar <- sidebarMenu(
    menuItem("Bar Charts", tabName = "bars", icon = icon("stats", lib = "glyphicon"))
)

shinyUI(dashboardPage(skin = "red",
  dashboardHeader(title = "Plotly Examples"),
  dashboardSidebar(sidebar),
  dashboardBody(
    includeCSS("www/custom.css"),
    tabItems(
      barUI
    )
  )
  )
)
