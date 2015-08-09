## Read in the dataset on assuming the text file containing the dataset is already available 
## after extracting from the zipped archive provided for the project
datafile <- read.table("household_power_consumption.txt", header=T, sep=";")

## Create a working file with required dataset on the range of dates
datafile$Date <- as.Date(datafile$Date, format="%d/%m/%Y")
workfile <- datafile[(datafile$Date=="2007-02-01") | (datafile$Date=="2007-02-02"),]

## Convert to numeric for analysis
workfile$Global_active_power <- as.numeric(as.character(workfile$Global_active_power))
workfile$Global_reactive_power <- as.numeric(as.character(workfile$Global_reactive_power))
workfile$Voltage <- as.numeric(workfile$Voltage))
workfile$Sub_metering_1 <- as.numeric(workfile$Sub_metering_1))
workfile$Sub_metering_2 <- as.numeric(workfile$Sub_metering_2))
workfile$Sub_metering_3 <- as.numeric(workfile$Sub_metering_3))

## Create a new colume for timestamp in the working file for plotting
workfile <- transform(workfile, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")


## PLOT 1
hist(workfile$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")

