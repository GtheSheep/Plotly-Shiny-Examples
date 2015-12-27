library(data.table)
library(stringr)

loans <- data.table::fread("LoanStats3c.csv", header = TRUE , sep = ",")
loans$int_rate <- as.numeric(stringr::str_replace(loans$int_rate, "%", ""))
