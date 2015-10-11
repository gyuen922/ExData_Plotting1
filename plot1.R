plot1 <- function() {
headstring <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
datestring <- c("December 16, 2006 17:24:00", "February 1, 2007 00:00:00", "February 2, 2007 23:59:00")
modtime <- as.POSIXct(strptime(datestring, "%B %d,%Y %H:%M:%S"))
skipint <- ((unclass(modtime[2])-unclass(modtime[1]))/60)+1
household_power_consumption <- read.table("C:/Users/yueng1/Desktop/R Programming/household_power_consumption.txt", sep=";", col.names=headstring, nrows=2880, skip=skipint)
png(filename = "plot1.png", width = 480, height = 480)
hist(household_power_consumption$Global_active_power, main = "Global active power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
}
