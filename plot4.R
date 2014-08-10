# plot4.R

#################################################################
# setwd("C:/Users/Alan Cheung/Desktop/Exploratory Data Analysis")
#################################################################

source("load_data.R")

plot4 <- function() {
	# calling load_data from load_data.R
    tbl <- load_data()
	
	# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
    png(filename = "plot4.png", width = 480, height = 480, units = "px")
    
	# Make the plots
    par(mfrow = c(2,2))
	
	
    with(tbl, {
	
		# Top left plot
        plot(DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
        
		# Top right plot
		plot(DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
        
        # Bottom left plot
        plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(DateTime, Sub_metering_2, type="l", col="red")
        lines(DateTime, Sub_metering_3, type="l", col="blue")
		cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        legend('topright', legend=cols, lty=1, lwd=1, col=c('black','blue','red'), bty='n')
		
		# Bottom right plot
        plot(DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")        
    })
	
    dev.off()
	}

plot4()