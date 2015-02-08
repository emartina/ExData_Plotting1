## Read the data specifying header, separator and the class of the columns
csv <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
## Filter the information for the dates between 01/02/2007 and 02/02/2007
csv_gap <- csv[csv$Date %in% c("1/2/2007", "2/2/2007"),]
## Plot specifying the color, labels and converting data types into time and numeric respectively

## Store in a png file
png("plot3.png", width=480, height=480)

## Plot black line
with(csv_gap, plot(strptime(paste(csv_gap$Date, csv_gap$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(csv_gap$Sub_metering_1), type = "l",  ylab = "Energy sub metering", xlab = "", col = "black"))

## Plot red line
with(csv_gap, lines(strptime(paste(csv_gap$Date, csv_gap$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(csv_gap$Sub_metering_2), col = "red"))

## Plot blue line
with(csv_gap, lines(strptime(paste(csv_gap$Date, csv_gap$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(csv_gap$Sub_metering_3), col = "blue"))

## Legend
legend("topright", cex = 1, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), inset = 0)


dev.off()
