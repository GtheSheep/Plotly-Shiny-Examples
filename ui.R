
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(shinydashboard)
library(plotly)

barUI <- tabItem(tabName = "bars", fluidPage(
  fluidRow(
    column(6, plotlyOutput("purpChart")),
    column(6, plotlyOutput("purpHorizChart"))),
  fluidRow(plotlyOutput("gradeChart"))
  )
)

surfaceUI <- tabItem(tabName = "surfaces", fluidPage(
  fluidRow(column(4,
    box(
    title = "Surface Note", width = NULL, background = "lime",
    "We've added the contour argument here as dynamic, this can either be disabled or defined (see docs)"
    )),
    column(8, plotlyOutput("surfaceChart")))
))

mapUI <- tabItem(tabName = "maps", fluidPage(
  fluidRow(
    column(4, box(
      title = "Maps Note", width = NULL, background = "lime",
      "Will look to add a UK version next, this may require incorporating a postcode to lat/long mapping dictionary"
    )),
    column(8, plotlyOutput("stateMapChart"))
  ),
  fluidRow(
    plotOutput("googleMap")
  )
))

pointUI <- tabItem(tabName = "points", fluidPage(
  fluidRow(
    column(4, box(
      title = "Copula Note", width = NULL, background = "lime",
      "Irrelevant to the actual data, but I like copulae so...."
    )),
    column(8, plotlyOutput("copulaChart"))
  )
))

statsUI <- tabItem(tabName = "stats", fluidPage(
  fluidRow(plotlyOutput("statsBoxChart"))
))

sidebar <- sidebarMenu(
    menuItem("Bar Charts", tabName = "bars", icon = icon("stats", lib = "glyphicon")),
    menuItem("Surface Charts", tabName = "surfaces", icon = icon("cubes")),
    menuItem("Maps", tabName = "maps", icon = icon("globe", lib = "glyphicon")),
    menuItem("Data Points", tabName = "points", icon = icon("record", lib = "glyphicon")),
    menuItem("Stats Charts", tabName = "stats", icon = icon("space-shuttle"))
)

shinyUI(dashboardPage(skin = "red",
  dashboardHeader(title = "Plotly Examples"),
  dashboardSidebar(sidebar),
  dashboardBody(
    includeCSS("www/custom.css"),
    tabItems(
      barUI,
      surfaceUI,
      mapUI,
      pointUI,
      statsUI
    )
  )
  )
)
