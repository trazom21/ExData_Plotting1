setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y") )
data.power = read.table("E:\\EDA\\household_power_consumption.txt", header=T, sep=';', as.is=T, na.strings="?",
                        colClasses=c("myDate", "character", rep("numeric", 7)))
data.power = subset(data.power, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
data.power$DT = as.POSIXct(strptime(paste(data.power$Date, data.power$Time), "%Y-%m-%d %H:%M:%S"))

par(mfrow=(c(2,2)))

plot(data.power$Global_active_power ~ data.power$DT, type="l", ylab="Global Active Power (kilowatts)", xlab="")

plot(data.power$Voltage ~ data.power$DT, type="l", ylab="Voltage (volt) ", xlab="")

plot(data.power$Sub_metering_1 ~ data.power$DT, type="l", ylab="Energy Sub Metering", xlab="", col="black")
lines(data.power$Sub_metering_2 ~ data.power$DT, col="Red")
lines(data.power$Sub_metering_3 ~ data.power$DT, col="Blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")

plot(data.power$Global_reactive_power ~ data.power$DT, type="l", ylab="Global Reactive Power (kilowatts) ", xlab="")

dev.copy(png, file ="plot4.png") 
dev.off()
