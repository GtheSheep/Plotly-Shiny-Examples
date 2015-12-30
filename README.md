# Plotly-Shiny-Examples
Examples of Plotly usage within R Shiny. This app takes demonstrations from Plotly's own documentation, stackoverflow questions, and adhoc designs to create a demonstration of how Plotly functions work and their data inputs.  
The data used is a sample loan tape that is openly available online from: https://resources.lendingclub.com/LoanStats3c.csv.zip  
With a full data dictionary (for those interested) available at: https://resources.lendingclub.com/LCDataDictionary.xlsx  
App can be launched in browser directly by running the following in RStudio:  
```{r eval=FALSE}
shiny::runGitHub("GtheSheep/Plotly-Shiny-Examples", launch.browser = TRUE)
```
CML mortgage data is also openly available on an aggregated basis, this can be sourced from: http://www.cml.org.uk/documents/postcode-lending-data-2015-q1/aggregate-postcode-data-output-2015-q1-website-version.xlsx 
where I have then stripped out the GB only tab for usage here, and stored in an easy to read format (.csv). 