# read data, filter to Feb 1-2, 2007 using pipe()
data <- read.table(pipe("grep -E '^(Date|[12]/2/2007)' household_power_consumption.txt"),  header=TRUE, sep=";")

# create device for png generation
png(filename = "plot1.png", width = 504, height = 504, units = "px", bg = "transparent")

# generate histogram with red bars, title and x axis labels
with(data, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red"))

# close png
dev.off()



