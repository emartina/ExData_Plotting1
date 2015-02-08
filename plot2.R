## Read the data specifying header, separator and the class of the columns
csv <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", colClasses = "character")
## Filter the information for the dates between 01/02/2007 and 02/02/2007
csv_gap <- csv[csv$Date %in% c("1/2/2007", "2/2/2007"),]

## Store in a png file
png("plot2.png", width=480, height=480)

## Plot specifying the color, labels and converting data types into time and numeric respectively
plot(strptime(paste(csv_gap$Date, csv_gap$Time), "%d/%m/%Y %H:%M:%S"), as.numeric(csv_gap$Global_active_power), type = "l",  ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()
