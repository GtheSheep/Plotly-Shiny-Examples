library(plyr)
library(dplyr)

balSummary <- function(databag, value){
  plyr::ddply(databag, value, summarise, bal=sum(as.numeric(loan_amnt)))
}

plotStackedBarChart <- function(databag, x, y, group){
  databag <- data.frame(databag)
  plot_ly(databag, x = databag[,x], y = databag[,y], group = databag[,group], type = "bar") %>%
  layout(barmode = "stack")
}

usaOpts <- list(
  scope = 'usa',
  projection = list(type = 'albers usa'),
  showlakes = TRUE,
  lakecolor = toRGB('blue')
)