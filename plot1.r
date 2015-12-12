plot1 <- function() {
library(dplyr)
library(lubridate)

## Get data file
        plot <- read.csv("plot_raw.csv", sep = "|", stringsAsFactors = F)

## Plot
        opar <- par()
        par(mfrow = c(1,1), mar = c(4,4,2,1), oma = c(0,0,0,0))
        with(plot, {
                hist(Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
                     main = "Global Active Power", breaks = 18, cex.axis = .75, cex.lab=.75)
                dev.copy(png, file = "plot1.png",width = 480,height = 480)
                dev.off()
                
## Restore default parameters
        par(opar)
})
}