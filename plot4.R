
#read the data set from the .txt file.
totaldata <- read.delim('household_power_consumption.txt', header=TRUE, sep=';')

#reformat and subset the data to the rows we intend to review
totaldata$Date <- as.Date(totaldata$Date, format="%d/%m/%Y")
totaldata <- subset(totaldata, totaldata$Date >= as.Date('2007-02-01') & totaldata$Date <= as.Date('2007-02-02'))
totaldata$fulltime = strptime(paste(totaldata$Date, totaldata$Time), format='%Y-%m-%d %H:%M:%S')

#Convert the data we are using to numeric... there should be a better way of doing this.
totaldata$Global_active_power = as.numeric(as.character(totaldata$Global_active_power))
totaldata$Sub_metering_1 = as.numeric(as.character(totaldata$Sub_metering_1))
totaldata$Sub_metering_2 = as.numeric(as.character(totaldata$Sub_metering_2))
totaldata$Sub_metering_3 = as.numeric(as.character(totaldata$Sub_metering_3))
totaldata$Voltage = as.numeric(as.character(totaldata$Voltage))
totaldata$Global_reactive_power = as.numeric(as.character(totaldata$Global_reactive_power))

png(file="plot4.png")

#set up the columns and rows.
par(mfrow=c(2,2))
plot(totaldata$fulltime, totaldata$Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", main="", type='l')

plot(totaldata$fulltime, totaldata$Voltage, xlab="datetime", ylab = "Voltage", main="", type='l')



plot(totaldata$fulltime, totaldata$Sub_metering_1, xlab="", ylab="Energy sub metering", type='n')
lines(totaldata$fulltime,totaldata$Sub_metering_1)
lines(totaldata$fulltime,totaldata$Sub_metering_2, col="red")
lines(totaldata$fulltime,totaldata$Sub_metering_3, col="blue")
legend("topright", lty =1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty='n')


plot(totaldata$fulltime, totaldata$Global_reactive_power, xlab="datetime", ylab = "Global_reactive_power", main="", type='l')

dev.off()