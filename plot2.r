plot2 <- function() {

## Get data file
        plot <- read.csv("plot_raw.csv", sep = "|", stringsAsFactors = F)
        plot$DateTime <- as.POSIXlt(plot$DateTime)
        
        
## Plot
        opar <- par()
        par(mfrow = c(1,1), mar = c(4,4,2,1), oma = c(0,0,0,0))
        with(plot, {
                plot(DateTime,Global_active_power, type = "l", 
                     xlab = "", ylab = "Global Active Power (kilowatts)", ylim = c(0,7), yaxt="n", 
                     cex.axis = .75, cex.lab=.75)
                axis(2, at = c(0,2,4,6), cex.axis = .75, cex.lab=.75)
                dev.copy(png, file = "plot2.png",width = 480,height = 480)
                dev.off()
        
## Restore default parameters
        par(opar)
        })
}