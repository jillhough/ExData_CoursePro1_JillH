HPC <- read.csv("household_power_consumption.txt", 
                colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                sep = ";", na.strings = "?")
HPC$Date = as.Date(HPC$Date, format="%d/%m/%Y")

## histogram of Global active Power
png(filename="plot1.png", bg="transparent", width=480, height=480, units="px")
hist(HPC.FEB01_FEB02_2007$Global_active_power, col = "red", 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
