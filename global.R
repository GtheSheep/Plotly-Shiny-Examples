library(data.table)
library(stringr)

loans <- data.table::fread("LoanStats3c.csv", header = TRUE , sep = ",")
loans$int_rate <- as.numeric(stringr::str_replace(loans$int_rate, "%", ""))

mortgages <- read.csv2("CML_GB_2015_Q1.csv", header = TRUE, sep = ",")
mortgages$Area <- substr(mortgages$Sector, 0, str_locate(mortgages$Sector, " ")[,1] - 1)
areas <- levels(as.factor(mortgages$Area))
areas <- paste(areas, ",GB", sep="")