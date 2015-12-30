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

#### ===== Specialty Functions ==== ####
# Source: http://www.r-bloggers.com/geocode-your-data-using-r-json-and-google-maps-geocoding-apis/
library("RJSONIO") #Load Library
getGeoCode <- function(gcStr)
{
  gcStr <- gsub(' ','%20',gcStr) #Encode URL Parameters
  #Open Connection
  connectStr <- paste('http://maps.google.com/maps/api/geocode/json?sensor=false&address=',gcStr, sep="") 
  con <- url(connectStr)
  data.json <- fromJSON(paste(readLines(con), collapse=""))
  close(con)
  #Flatten the received JSON
  data.json <- unlist(data.json)
  lat <- data.json["results.geometry.location.lat"]
  lng <- data.json["results.geometry.location.lng"]
  gcodes <- c(lat, lng)
  names(gcodes) <- c("Lat", "Lng")
  return (gcodes)
}