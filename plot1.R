## Read the data specifying header, separator and the class of the columns
csv <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
## Filter the information for the dates between 01/02/2007 and 02/02/2007
csv_gap <- csv[csv$Date %in% c("1/2/2007", "2/2/2007"),]
## Histogram specifying the color, labels and main title
png("plot1.png", width=480, height=480)
hist(as.numeric(csv_gap$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

