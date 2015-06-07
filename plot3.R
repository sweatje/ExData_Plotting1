# read data, filter to Feb 1-2, 2007 using pipe()
data <- read.table(pipe("grep -E '^(Date|[12]/2/2007)' household_power_consumption.txt"),  header=TRUE, sep=";")
# add datetime column
data$DateTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %T")

# create device for png generation
png(filename = "plot3.png", width = 504, height = 504, units = "px", bg = "transparent")

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



