# read data, filter to Feb 1-2, 2007 using pipe()
data <- read.table(pipe("grep -E '^(Date|[12]/2/2007)' household_power_consumption.txt"),  header=TRUE, sep=";")
# add datetime column
data$DateTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %T")

# create device for png generation
png(filename = "plot4.png", bg = "transparent")

# setup a two by two grid for plot output
par(mfrow=c(2,2))

# upper left line chart of Active Power
with(data, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power"))

# upper right chard Voltage
with(data, plot(DateTime, Voltage, type="l", xlab="datetime"))


# lower left chart sub metering
with(data, plot(DateTime, Sub_metering_1, type="l", col="black", ylab="Energy Sub Metering", xlab=""))
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
        col=c('black', 'red', 'blue'), lty='solid', bty="n")


# lower right chart, line plot of reactive power
with(data, plot(DateTime, Global_reactive_power, type="l", xlab="datetime"))

# close png file
dev.off()







# generate line plot y axis labels
with(data, plot(DateTime, Sub_metering_1, ylab='Energy Sub Metering', xlab='', type="l"))
# Add second and third sub_metering data lines
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
# add legend
legend('topright', legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
    col=c('black', 'red', 'blue'), lty='solid')

# close png
dev.off()



