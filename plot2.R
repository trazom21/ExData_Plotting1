setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y") )
data.power = read.table("E:\\EDA\\household_power_consumption.txt", header=T, sep=';', as.is=T, na.strings="?",
                        colClasses=c("myDate", "character", rep("numeric", 7)))
data.power = subset(data.power, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
data.power$DT = as.POSIXct(strptime(paste(data.power$Date, data.power$Time), "%Y-%m-%d %H:%M:%S"))

plot(data.power$Global_active_power ~ data.power$DT, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file ="plot2.png") 
dev.off()