# read data, filter to Feb 1-2, 2007 using pipe()
data <- read.table(pipe("grep -E '^(Date|[12]/2/2007)' household_power_consumption.txt"),  header=TRUE, sep=";")
# add datetime column
data$DateTime <- strptime(paste(data$Date,data$Time), format="%d/%m/%Y %T")

# create device for png generation
png(filename = "plot2.png", width = 504, height = 504, units = "px", bg = "transparent")

# generate line plot with y axis label
with(data, plot(DateTime, Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type="l"))

# close png
dev.off()



