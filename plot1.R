
#read the data set from the .txt file.
totaldata <- read.delim('household_power_consumption.txt', header=TRUE, sep=';')

#reformat and subset the data to the rows we intend to review
totaldata$Date <- as.Date(totaldata$Date, format="%d/%m/%Y")
totaldata <- subset(totaldata, totaldata$Date >= as.Date('2007-02-01') & totaldata$Date <= as.Date('2007-02-02'))
totaldata$fulltime = strptime(paste(totaldata$Date, totaldata$Time), format='%Y-%m-%d %H:%M:%S')

#Convert the data we are using to numeric
totaldata$Global_active_power = as.numeric(as.character(totaldata$Global_active_power))

png(file="plot1.png")
#draw the histogram
#totaldata <- transform(totaldata, Global_active_power = factor(Global_active_power))
hist(totaldata$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()