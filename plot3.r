plot3 <- function() {
        
## Get data file
        plot <- read.csv("plot_raw.csv", sep = "|", stringsAsFactors = F)
        plot$DateTime <- as.POSIXlt(plot$DateTime)
        
## Plot
        opar <- par()
        par(mfrow = c(1,1), mar = c(4,4,2,1), oma = c(0,0,0,0))
        with(plot, {
                plot(DateTime,Sub_metering_1, type = "l", col = "black", 
                     ylab = "Energy sub meeting", xlab = "", cex.axis = .75, cex.lab=.75)
                points(DateTime,Sub_metering_2, type = "l", col = "red") 
                points(DateTime,Sub_metering_3, type = "l", col = "blue")
                legend("top", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
                       col = c("black","red","blue"), y.intersp = .4, lwd = 1, bty ="n", lty = 1, cex=0.7)
               
                dev.copy(png, file = "plot3.png",width = 480,height = 480)
                dev.off()
                
## Restore default parameters
        par(opar)
        })
}