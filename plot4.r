HPC <- read.csv("household_power_consumption.txt", 
                colClasses = c("factor", "factor", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"),
                sep = ";", na.strings = "?")
HPC$Date = as.Date(HPC$Date, format="%d/%m/%Y")
HPC.FEB01_2007 <- subset(HPC, (as.character(Date)) == "2007-02-01")
HPC.FEB02_2007 <- subset(HPC, (as.Date(Date)) == "2007-02-02")
mergedData <- rbind(HPC.FEB01_2007, HPC.FEB02_2007)

png(filename="plot4.png", bg="transparent", width=480, height=480, units="px")
par(mfrow=c(2,2))

plot(mergedData$Time, mergedData$Voltage)
lines(mergedData$Date, lab = c(3,5,7), xlab=c("Thurs", "Fri", "Sat"),
      ylab = "Voltage")

plot(mergedData$Time, mergedData$Sub_metering_1, col="black", xlab=NULL,
     type = "l", ylab = "Energy sub metering")
plot(mergedData$Time, mergedData$Sub_metering_2, col="red", xlab=NULL,
     type = "l")
plot(mergedData$Time, mergedData$Sub_metering_3, col="blue", xlab=NULL,
     type = "l")
legend("topright", c("sub metering 1","sub metering 2","sub metering 3"),
       lty=1, col= c('black','red','blue'))

plot(mergedData$Time, mergedData$Global_reactive_power)
lines(mergedData$Date, lab = c(3,5,7), xlab=c("Thurs", "Fri", "Sat"),
      ylab = "Global Reactive Power")

dev.off()