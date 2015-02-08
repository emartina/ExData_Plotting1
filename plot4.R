## Read the data specifying header, separator and the class of the columns
csv <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
## Filter the information for the dates between 01/02/2007 and 02/02/2007
csv_gap <- csv[csv$Date %in% c("1/2/2007", "2/2/2007"),]

## Store in a png file
png("plot4.png", width=480, height=480)

## Establish the matrix of plots (2x2)
par(mfrow = c(2, 2))

## Plot 4 plots specifying the color, labels and converting data types into time and numeric respectively
with(csv_gap, {
  plot(strptime(paste(csv_gap$Date, csv_gap$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(csv_gap$Global_active_power), type = "l",  ylab = "Global Active Power", xlab = "")
  plot(strptime(paste(csv_gap$Date, csv_gap$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(csv_gap$Voltage), type = "l",  ylab = "Voltage", xlab = "datetime")
  with(csv_gap, plot(strptime(paste(csv_gap$Date, csv_gap$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(csv_gap$Sub_metering_1), type = "l",  ylab = "Energy sub metering", xlab = "", col = "black"))
  with(csv_gap, lines(strptime(paste(csv_gap$Date, csv_gap$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(csv_gap$Sub_metering_2), col = "red"))
  with(csv_gap, lines(strptime(paste(csv_gap$Date, csv_gap$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(csv_gap$Sub_metering_3), col = "blue"))
  legend("topright", bty = "n", cex=0.5, lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(strptime(paste(csv_gap$Date, csv_gap$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(csv_gap$Global_reactive_power), type = "l",  ylab = "Global_reactive_power", xlab = "datetime")
  })

dev.off()
