setAs("character", "myDate", function(from) as.Date(from, format="%d/%m/%Y") )
data.power = read.table("E:\\EDA\\household_power_consumption.txt", header=T, sep=';', as.is=T, na.strings="?",
                        colClasses=c("myDate", "character", rep("numeric", 7)))
data.power = subset(data.power, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
data.power$DT = strptime(paste(data.power$Date, data.power$Time), "%Y-%m-%d %H:%M:%S")

hist(data.power$Global_active_power, col='red', main="Global Active Power", 
     xlab="Global Active Power (Kilowwatts")