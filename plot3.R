setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y") )
data.power = read.table("E:\\EDA\\household_power_consumption.txt", header=T, sep=';', as.is=T, na.strings="?",
                        colClasses=c("myDate", "character", rep("numeric", 7)))
data.power = subset(data.power, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
data.power$DT = as.POSIXct(strptime(paste(data.power$Date, data.power$Time), "%Y-%m-%d %H:%M:%S"))

plot(data.power$Sub_metering_1 ~ data.power$DT, type="l", ylab="Energy Sub Metering", xlab="", col="black")
lines(data.power$Sub_metering_2 ~ data.power$DT, col="Red")
lines(data.power$Sub_metering_3 ~ data.power$DT, col="Blue")
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file ="plot3.png") 
dev.off()