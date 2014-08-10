# plot1.R

#################################################################
# setwd("C:/Users/Alan Cheung/Desktop/Exploratory Data Analysis")
#################################################################

source("load_data.R")

plot1 <- function() {
	# calling load_data from load_data.R
    tbl <- load_data()
	
	# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
    png(filename = "plot1.png", width = 480, height = 480, units = "px")
	
    hist(tbl$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
    dev.off()
	}

plot1()