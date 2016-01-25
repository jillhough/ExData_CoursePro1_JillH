## line graph of Global active Power

HPC <- read.csv("household_power_consumption.txt", 
                colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                sep = ";", na.strings = "?")
HPC$Date = as.Date(HPC$Date, format="%d/%m/%Y")
HPC.FEB01_2007 <- subset(HPC, (as.character(Date)) == "2007-02-01")
HPC.FEB02_2007 <- subset(HPC, (as.Date(Date)) == "2007-02-02")
mergedData <- rbind(HPC.FEB01_2007, HPC.FEB02_2007)



png(filename="plot2.png", bg="transparent", width=480, height=480, units="px")
plot(mergedData$Time, mergedData$Global_active_power)
lines(mergedData$Date, lab = c(3,5,7), xlab=c("Thurs", "Fri", "Sat"),
      ylab = "Global Active Power (kilowatts)")
dev.off()