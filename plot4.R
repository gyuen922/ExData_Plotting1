plot4 <- function() {
  headstring <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  datestring <- c("December 16, 2006 17:24:00", "February 1, 2007 00:00:00", "February 2, 2007 23:59:00")
  modtime <- as.POSIXct(strptime(datestring, "%B %d,%Y %H:%M:%S"))
  skipint <- ((unclass(modtime[2])-unclass(modtime[1]))/60)+1
  household_power_consumption <- read.table("C:/Users/yueng1/Desktop/R Programming/household_power_consumption.txt", sep=";", col.names=headstring, nrows=2880, skip=skipint)
  household_power_consumption$Time<- as.POSIXlt(strptime(paste(household_power_consumption$Date,household_power_consumption$Time), "%d/%m/%Y %H:%M:%S"))
  png(filename = "plot4.png", width = 480, height = 480)
  par(mfrow=c(2,2))
  plot(household_power_consumption$Time, household_power_consumption$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab = "")
  plot(household_power_consumption$Time, household_power_consumption$Voltage, type="l", xlab = "dateline", ylab="voltage")
  plot(household_power_consumption$Time, household_power_consumption$Sub_metering_1, type="l", ylab="Energy sub metering", xlab = "")
  points(household_power_consumption$Time, household_power_consumption$Sub_metering_2, type="l", col = "red")
  points(household_power_consumption$Time, household_power_consumption$Sub_metering_3, type="l", col = "blue")
  legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black", "red", "blue"), lty=1, bty = "n")
  plot(household_power_consumption$Time, household_power_consumption$Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power")
  dev.off()
}

