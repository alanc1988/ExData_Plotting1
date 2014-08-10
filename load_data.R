# Exploratory Data Analysis | Programming Assignment 1
# Data Set: Electric Power Consumption
# Source: UC Irvine Machine Learning Repository

# Description:
# 		Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. 
# 		Different electrical quantities and some sub-metering values are available.

# load_data.R

#################################################################
# setwd("C:/Users/Alan Cheung/Desktop/Exploratory Data Analysis")
#################################################################

# this function is used to download the file household_power_consumption.zip from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# if we have already downloaded it before, there's no need to download it again
download_file <- function(fileURL, fname){
	if(!file.exists(fname)){
		download.file(fileURL, destfile=fname)
		}
    fname
	}

load_data <- function() {
	# We will name the fixed csv file "data_file.csv"
    data_file <- "data_file.csv"
	
	# If the file exists then we simply read in the file
	# If not, then we get and clean the data
    if(file.exists(data_file)){
		tbl <- read.csv(data_file)
		tbl$DateTime <- strptime(tbl$DateTime, "%Y-%m-%d %H:%M:%S")
		}
	else {
		fname <- download_file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")
        con <- unz(fname, "household_power_consumption.txt")
		
		# Note that in this dataset missing values are coded as "?"
        tbl <- read.table(con, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
		
		# We will only be using data from the dates 2007-02-01 and 2007-02-02. 
		# One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
        tbl <- tbl[(tbl$Date == "1/2/2007") | (tbl$Date == "2/2/2007"),]
		
		# You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions
        tbl$DateTime <- strptime(paste(tbl$Date, tbl$Time), "%d/%m/%Y %H:%M:%S")
        write.csv(tbl, data_file)
    }
    tbl
	}