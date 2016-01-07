###################################################
# Make sure that the data file is in the working directory
# epc contains entire data set
epc <- read.table("household_power_consumption.txt",header = TRUE, sep=";",na.strings = "?", colClasses = 
c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

epc$Date_Time <- strptime(paste(epc$Date,epc$Time),"%d/%m/%Y %H:%M:%S")


epc$Date <- NULL
epc$Time <- NULL

#epc_2 contains 2 days of data
epc_2 <- epc[epc$Date_Time >= "2007-02-01" & epc$Date_Time < "2007-02-03" & !is.na(epc$Date_Time),]

par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
with(epc_2, {
  plot(Date_Time,Global_active_power, ylab="Global Active Power",cex = 0, type="o")
  plot(Date_Time, Voltage, xlab = "datetime", ylab = "Voltage",cex = 0, type="o")
  with(epc_2, 
       plot(Date_Time,Sub_metering_1, ylab="Energy sub metering", xlab = "",cex = 0, type="o", col = "black",ylim=c(0,40)))
  par(new=TRUE)
  with(epc_2, 
       plot(Date_Time,Sub_metering_2, ylab="Energy sub metering", xlab = "",cex = 0, type="o", col = "red",ylim=c(0,40)))
  par(new=TRUE)
  with(epc_2, 
       plot(Date_Time,Sub_metering_3, ylab="Energy sub metering", xlab = "",cex = 0, type="o", col = "blue",ylim=c(0,40)))
  legend("topright",lty=1, col = c("black", "red", "blue"), cex=0.64,
         legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3" ),bty = "n")
  plot(Date_Time, Global_reactive_power, xlab = "datetime",cex = 0, type="o")
  outer = FALSE
})
#Increased width to 600 to accomodate legend
dev.copy(png, file="plot4.png",width = 600, height = 480, units = "px")
dev.off()
