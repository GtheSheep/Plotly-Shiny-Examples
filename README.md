# Plotly-Shiny-Examples
Examples of Plotly usage within R Shiny. This app takes demonstrations from Plotly's own documentation, stackoverflow questions, and adhoc designs to create a demonstration of how Plotly functions work and their data inputs. For a full Plotly in R reference guide: https://plot.ly/r/reference/  
The data used is a sample loan tape that is openly available online from: https://resources.lendingclub.com/LoanStats3c.csv.zip  
With a full data dictionary (for those interested) available at: https://resources.lendingclub.com/LCDataDictionary.xlsx  
App can be launched in browser directly by running the following in RStudio:  
```{r eval=FALSE}
shiny::runGitHub("GtheSheep/Plotly-Shiny-Examples", launch.browser = TRUE)
```
Or the app is hosted at:  
https://gjames.shinyapps.io/Plotly-Shiny-Examples
CML mortgage data is also openly available on an aggregated basis, this can be sourced from: http://www.cml.org.uk/documents/postcode-lending-data-2015-q1/aggregate-postcode-data-output-2015-q1-website-version.xlsx 
where I have then stripped out the GB only tab for usage here, and stored in an easy to read format (.csv).  
Although geocoding functions will be added and fine tuned as the demo is developed, it is worth noting that as part of the Google Maps API agreement, any geocoding done using this API must be displayed on a Google Map. The API also has usage limits, so the geocoding will be done outside of the Shiny application, but the code will be included here for completeness, with sources referenced.  
To take a look at the geocoding from Google:
```{r eval=FALSE}
install.packages("ggmap")
library(ggmap)
```