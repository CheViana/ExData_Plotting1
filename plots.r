# To extract relevant data

df <- read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
md <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
datetime <- paste(md$Date, md$Time, sep=" ")
timevar <- strptime(datetime, format="%D/%M/%Y %H:%M:%S")

# first plot

hist(md$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")

# second plot

plot(timevar, md$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")

# third plot

plot(timevar, md$Sub_metering_1, col="darkgrey", ylab="Energy sub metering", xlab="", type="l")
lines(timevar, md$Sub_metering_2, col="red")
lines(timevar, md$Sub_metering_3, col="blue")
legend("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col=c("darkgrey", "red", "blue"), lty=1)

# fourth plot

par(mfrow=c(2,2))
plot(timevar, md$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
plot(timevar, md$Voltage, ylab="Voltage", xlab="datetime", type="l")
plot(timevar, md$Sub_metering_1, col="darkgrey", ylab="Energy sub metering", xlab="", type="l")
lines(timevar, md$Sub_metering_2, col="red")
lines(timevar, md$Sub_metering_3, col="blue")
legend("topright", c("Sub metering 1", "Sub metering 2", "Sub metering 3"), col=c("darkgrey", "red", "blue"), lty=1, bty="n")
plot(timevar, md$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")