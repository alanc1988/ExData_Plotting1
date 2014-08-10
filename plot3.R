# plot3.R

#################################################################
# setwd("C:/Users/Alan Cheung/Desktop/Exploratory Data Analysis")
#################################################################

source("load_data.R")

plot3 <- function() {
	# calling load_data from load_data.R
    tbl <- load_data()
	
	# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
    png(filename = "plot3.png", width = 480, height = 480, units = "px")
	
    cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    plot(tbl$DateTime, tbl$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(tbl$DateTime, tbl$Sub_metering_2, type="l", col="red")
    lines(tbl$DateTime, tbl$Sub_metering_3, type="l", col="blue")
    legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
    dev.off()
}

plot3()