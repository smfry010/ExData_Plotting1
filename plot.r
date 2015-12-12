plot <- function() {
library(dplyr)
library(lubridate)

## Get data file
        #setwd("C:/Users/smfry_000/Desktop/Coursera/R/4_Exploratory/week_1")
        file <- read.csv2("household_power_consumption.txt", stringsAsFactors = F)

## Clean data
        file$Date <- as.Date(gsub("UTC", "",dmy(file$Date)))
        file <- filter(file, Date >= "2007-02-01" & Date <= "2007-02-02")
        file$Global_active_power <- as.numeric(as.character(file$Global_active_power))
        
## Create new DateTime column
        file$DateTime <- paste0(file$Date,file$Time)

## Output file
        write.table(x = file, file = "plot_raw.csv", sep = "|", row.names = F)
}