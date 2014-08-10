# plot2.R

#################################################################
# setwd("C:/Users/Alan Cheung/Desktop/Exploratory Data Analysis")
#################################################################

source("load_data.R")

plot2 <- function() {
	# calling load_data from load_data.R
    tbl <- load_data()
	
	# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
    png(filename = "plot2.png", width = 480, height = 480, units = "px")
	
    plot(tbl$DateTime, tbl$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off()
}

plot2()